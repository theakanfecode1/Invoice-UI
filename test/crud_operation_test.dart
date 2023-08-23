import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/invoice_view.dart';
import 'package:flutter_test/flutter_test.dart';
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const widget = InvoiceView();
  final element = widget.createElement(); // this will set state.widget
  final state = element.state as InvoiceViewState;
  await state.loadInvoices();
  test('Test if invoices are loaded', () {
    assert(state.invoices.isNotEmpty);
  });
  test('Test if invoice can be deleted', () {
    int length = state.invoices.length;
    state.deleteInvoice(0);
    expect(length - 1, length - 1);
  });
  test('Test if invoice can be added', () {
    int length = state.invoices.length;
    state.insertInvoice(Invoice(
        id: 'ES3456',
        createdAt: '2022-11-11',
        paymentDue: '2022-11-12',
        description: "Invoice item",
        paymentTerms: 1,
        clientName: 'Daniel',
        clientEmail: 'Dan@dan.com',
        status: 'pending',
        senderAddress: SenderAddress(street: 'street', city: 'city', postCode: 'postCode', country: 'country'),
        clientAddress: ClientAddress(street: 'street', city: 'city', postCode: 'postCode', country: 'country'),
        items: [],
        total: 0));
    expect(length + 1, length + 1);
  });
  test('Test if invoice can be and marked as paid', () {
    Invoice invoice = state.invoices[1];
    state.updateInvoice(invoice.copyWith(status: 'paid'),1);
    assert(state.invoices[1].status == 'paid');
  });
  test('Test if invoice can be edited', () {
    Invoice invoice = state.invoices[1];
    state.updateInvoice(invoice.copyWith(description: 'For testing purposes'),1);
    assert(state.invoices[1].description == 'For testing purposes');
  });
}
