

import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter_test/flutter_test.dart';

bool checkPattern(String input) {
  final pattern = RegExp(r'^[A-Z]{2}\d{4}$');
  return pattern.hasMatch(input);
}

void main() {
  test('Test ID generation,ID should be 2 random uppercased letters followed by 4 random numbers ', () {
    String id = generateID();
    expect(checkPattern(id), true);
  });
}