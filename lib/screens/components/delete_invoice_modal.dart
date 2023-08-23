import 'package:boya_invoice_app/screens/components/buttons.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeleteInvoiceModal extends StatelessWidget {
  final VoidCallback onDelete;
  final String invoiceId;
  const DeleteInvoiceModal({Key? key, required this.onDelete, required this.invoiceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.blue700,
      child: Container(
        width: 450,
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal:40),
        decoration: BoxDecoration(
          color: AppColors.blue700,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Confirm Deletion',style: AppTextStyles.kH2Light,),
            const SizedBox(
              height: 15,
            ),
            Text('Are you sure you want to delete invoice #$invoiceId? This action cannot be undone.',style: AppTextStyles.kB2,),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWithHover(
                  label: 'Cancel',
                  color: AppColors.blue500,
                  hoverColor: AppColors.white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                ButtonWithHover(
                  label: 'Delete',
                  color: AppColors.orange700,
                  hoverColor: AppColors.orange600,
                  onTap: (){
                    Navigator.pop(context);
                    onDelete();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
