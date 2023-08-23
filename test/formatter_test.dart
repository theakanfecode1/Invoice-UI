

import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Format time stamp', () {
    String result = formatDate('2022-06-30');
    expect(result, '30 Jun 2022');
  });

  test('Format amount', () {
    String result = formatAmount(1000);
    expect(result, "1,000.00");
  });
}