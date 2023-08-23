import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/components/buttons.dart';
import 'package:boya_invoice_app/screens/components/invoice_status_indicator.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class InvoiceDetailsHeader extends StatelessWidget {
  final Invoice invoice;
  final VoidCallback onMarkAsPaid;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const InvoiceDetailsHeader({Key? key, required this.invoice, required this.onMarkAsPaid, required this.onDelete, required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      decoration: BoxDecoration(
          color: AppColors.blue600, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Text(
            'Status',
            style: AppTextStyles.kB1,
          ),
          const SizedBox(
            width: 15,
          ),
          InvoiceStatusIndicator(invoice: invoice),
          const Spacer(),
          ButtonWithHover(
            label: 'Edit',
            color: AppColors.blue500,
            hoverColor: AppColors.white,
            onTap: onEdit,
          ),
          const SizedBox(
            width: 15,
          ),
          ButtonWithHover(
            label: 'Delete',
            color: AppColors.orange700,
            hoverColor: AppColors.orange600,
            onTap: onDelete,
          ),
          // Display mark as paid for unpaid invoices

          if(invoice.status != 'paid')
            Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              ButtonWithHover(
                label: 'Mark as Paid',
                color: AppColors.purple700,
                hoverColor: AppColors.purple600,
                onTap: onMarkAsPaid,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
