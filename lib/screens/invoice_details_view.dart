import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/components/delete_invoice_modal.dart';
import 'package:boya_invoice_app/screens/components/edit_invoice_modal.dart';
import 'package:boya_invoice_app/screens/components/invoice_details_body.dart';
import 'package:boya_invoice_app/screens/components/invoice_details_header.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceDetailsView extends StatefulWidget {
  final Invoice? invoice;
  final Function(Invoice)? onMarkAsPaid;
  final Function(Invoice)? onEdit;
  final VoidCallback? onDelete;

  const InvoiceDetailsView(
      {Key? key, this.invoice, this.onMarkAsPaid, this.onDelete, this.onEdit})
      : super(key: key);

  @override
  State<InvoiceDetailsView> createState() => _InvoiceDetailsViewState();
}

class _InvoiceDetailsViewState extends State<InvoiceDetailsView> {
  late Invoice invoice;

  @override
  void initState() {
    invoice = widget.invoice!;
    super.initState();
  }

  void markAsPaid() {
    setState(() {
      invoice = invoice.copyWith(status: 'paid');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/icon-arrow-left.svg',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Go back',
                    style: AppTextStyles.kH3Lightx1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InvoiceDetailsHeader(
              invoice: invoice,
              onMarkAsPaid: () {
                markAsPaid();
                widget.onMarkAsPaid!(invoice);
              },
              onDelete: () {
                showDialog(
                    context: context,
                    builder: (context) => DeleteInvoiceModal(
                          invoiceId: invoice.id,
                          onDelete: () {
                            Navigator.pop(context);
                            widget.onDelete!();
                          },
                        ));
              },
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (BuildContext cxt) {
                    return EditInvoiceModal(
                      invoice: invoice,
                      onSaveInvoice: (updatedInvoice) {
                        setState(() {
                          invoice = updatedInvoice;
                        });
                        widget.onEdit!(updatedInvoice);
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            InvoiceDetailsBody(
              invoice: invoice,
            )
          ],
        ),
      ),
    );
  }
}
