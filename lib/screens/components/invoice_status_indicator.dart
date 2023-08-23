import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';

class InvoiceStatusIndicator extends StatelessWidget {
  final Invoice invoice;

  const InvoiceStatusIndicator({Key? key, required this.invoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: getInvoiceStatusColor(invoice.status).withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 5,
                backgroundColor: getInvoiceStatusColor(invoice.status)),
            const SizedBox(
              width: 5,
            ),
            Text(
              invoice.status.replaceFirst(
                  invoice.status[0], invoice.status[0].toUpperCase()),
              style: getInvoiceStatusTextStyle(invoice.status),
            )
          ],
        ),
      ),
    );
  }
}
