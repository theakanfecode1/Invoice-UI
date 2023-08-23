

import 'dart:math';

import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String date){
  return date.isEmpty ? '(Date not set)':DateFormat('dd MMM yyyy').format(DateTime.parse(date));
}
String generateID() {
  final random = Random();
  // To generate two random uppercase letters
  final roundLetters =
  List.generate(2, (_) => String.fromCharCode(random.nextInt(26) + 65));
  // To generate four random numbers
  final roundNumbers = List.generate(4, (_) => random.nextInt(10));
  // Concatenate the letters and numbers to form the ID
  final id = '${roundLetters.join()}${roundNumbers.join()}';

  return id;
}

Route scaleIn(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, page) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return ScaleTransition(
        scale: animation.drive(tween),
        child: page,
      );
    },
  );
}

String formatAmount(dynamic amount){
  var formatter = NumberFormat('#,###,##0.00');
  return formatter.format(amount);

}

Color getInvoiceStatusColor(String status){
  if(status.toLowerCase() == 'pending'){
    return Colors.deepOrangeAccent;
  }else if(status.toLowerCase() == 'draft'){
    return AppColors.white;
  }
  else{
    return Colors.green;
  }
}

TextStyle getInvoiceStatusTextStyle(String status){
  if(status.toLowerCase() == 'pending'){
    return AppTextStyles.kH3Orange600;
  }else if(status.toLowerCase() == 'draft'){
    return AppTextStyles.kH3grey600x1;
  }
  else{
    return AppTextStyles.kH3Green600;
  }
}