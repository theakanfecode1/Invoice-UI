import 'package:boya_invoice_app/screens/components/buttons.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class InvoiceActionsForCreate extends StatelessWidget {
  final VoidCallback onDiscard;
  final VoidCallback onSaveSend;
  final VoidCallback onSaveAsDraft;

  const InvoiceActionsForCreate(
      {Key? key,
      required this.onDiscard,
      required this.onSaveSend,
      required this.onSaveAsDraft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
      decoration: const BoxDecoration(
        color: AppColors.blue700,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          children: [
            ButtonWithHover(
              label: 'Discard',
              color: AppColors.grey500,
              hoverColor: AppColors.white,
              textStyle: AppTextStyles.kH3grey600x1,
              onTap: onDiscard,
            ),
            const Spacer(),
            ButtonWithHover(
              label: 'Save as Draft',
              color: AppColors.grey700,
              hoverColor: AppColors.black600,
              onTap: onSaveAsDraft,
            ),
            const SizedBox(
              width: 15,
            ),
            ButtonWithHover(
              label: 'Save & Send',
              color: AppColors.purple700,
              hoverColor: AppColors.purple600,
              onTap: onSaveSend,
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceActionsForEdit extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSaveChanges;

  const InvoiceActionsForEdit(
      {Key? key,
        required this.onCancel,
        required this.onSaveChanges,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
      decoration: const BoxDecoration(
        color: AppColors.blue700,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWithHover(
              label: 'Cancel',
              color: AppColors.blue500,
              hoverColor: AppColors.white,
              onTap: onCancel,
            ),
            const SizedBox(
              width: 15,
            ),
            ButtonWithHover(
              label: 'Save Changes',
              color: AppColors.purple700,
              hoverColor: AppColors.purple600,
              onTap: onSaveChanges,
            ),
          ],
        ),
      ),
    );
  }
}

