import 'package:boya_invoice_app/screens/components/side_bar.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  const BaseView({super.key,  required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue700,
      body: Row(
        children: [
          const SideBar(),
          Expanded(child: child),

        ],
      ),
    );
  }
}

