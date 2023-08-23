import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/components/invoice_status_indicator.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceListItem extends StatelessWidget {
  final Invoice invoice;
  final VoidCallback onTap;

  const InvoiceListItem({Key? key, required this.invoice, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.blue600, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text.rich(
                TextSpan(
                  text: '#',
                  style: AppTextStyles.kH3grey600x1,
                  children: [
                    TextSpan(
                      text: invoice.id,
                      style: AppTextStyles.kH3Lightx1,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                'Due ${formatDate(invoice.paymentDue)}',
                style: AppTextStyles.kB1,
              ),
              const Spacer(),
              Text(
                invoice.clientName.isEmpty ? 'No Client Name' : invoice.clientName ,
                style: AppTextStyles.kB1,
              ),
              const Spacer(),
              Text(
                '£${formatAmount(invoice.total)}',
                style: AppTextStyles.kH3Lightx2,
              ),
              const Spacer(),
              InvoiceStatusIndicator(invoice: invoice),
              const Spacer(),
              SvgPicture.asset(
                'assets/svgs/icon-arrow-right.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
