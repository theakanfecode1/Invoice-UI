import 'dart:convert';

import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/components/add_invoice_modal.dart';
import 'package:boya_invoice_app/screens/components/buttons.dart';
import 'package:boya_invoice_app/screens/components/invoice_list_item.dart';
import 'package:boya_invoice_app/screens/invoice_details_view.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  State<InvoiceView> createState() => InvoiceViewState();
}

@visibleForTesting
class InvoiceViewState extends State<InvoiceView> {
  List<Invoice> invoices = [];

  Future<void> loadInvoices() async {
    final String response =
        await rootBundle.loadString('starter-code/data.json');
    final data = await json.decode(response);
    setState(() {
      invoices = (data as List<dynamic>)
          .map((data) => Invoice.fromJson(data))
          .toList(growable: true);
    });

  }

  void insertInvoice(Invoice invoice){
    setState(() {
      invoices.insert(0, invoice);
    });
  }

  void deleteInvoice(int index){
    setState(() {
      invoices.removeAt(index);
    });

  }

  void updateInvoice(Invoice invoice,int index){
    setState(() {
      invoices[index] = invoice;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,loadInvoices);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invoices',
                      style: AppTextStyles.kH1Light,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      invoices.isEmpty
                          ? 'No invoices'
                          : 'There are ${invoices.length} total invoices',
                      style: AppTextStyles.kB2,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Filter by status',
                      style: AppTextStyles.kH3Lightx1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/icon-arrow-down.svg',
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                ButtonWithIcon(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext cxt) {
                        return AddInvoiceModal(
                          onAddInvoice: insertInvoice,
                          onSaveDraftInvoice: insertInvoice
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: invoices.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/illustration-empty.svg',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'There is nothing here',
                          style: AppTextStyles.kH2Light,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text.rich(
                          TextSpan(
                            text: 'Create an invoice by clicking the \n',
                            style: AppTextStyles.kB1grey600,
                            children: [
                              TextSpan(
                                text: 'New Invoice',
                                style: AppTextStyles.kH3grey600x1,
                              ),
                              TextSpan(
                                text: ' button and get started',
                                style: AppTextStyles.kB1grey600,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ListView.builder(
                          itemCount: invoices.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => InvoiceListItem(
                                invoice: invoices[index],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      scaleIn(InvoiceDetailsView(
                                        invoice: invoices[index],
                                        onMarkAsPaid: (invoice) {
                                          updateInvoice(invoice, index);
                                        },
                                        onEdit: (invoice) {
                                          updateInvoice(invoice, index);
                                        },
                                        onDelete:(){
                                          deleteInvoice(index);
                                        },
                                      )));
                                },
                              )),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
