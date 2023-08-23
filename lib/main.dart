import 'package:boya_invoice_app/screens/base_view.dart';
import 'package:boya_invoice_app/screens/invoice_details_view.dart';
import 'package:boya_invoice_app/screens/invoice_view.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Boya Invoice App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.blue600,
            fontFamily: ('Spartan' ),
            colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.blue600)),
        builder: (context, child) => BaseView(child: child!),
        initialRoute: '/',
        routes: {
          '/': (context) => const InvoiceView(),
          '/InvoiceDetailsView': (context) => const InvoiceDetailsView(),
        },
    );
  }
}

