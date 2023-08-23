import 'dart:math';

import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/screens/components/app_textfield.dart';
import 'package:boya_invoice_app/screens/components/billing_forms.dart';
import 'package:boya_invoice_app/screens/components/buttons.dart';
import 'package:boya_invoice_app/screens/components/invoice_actions.dart';
import 'package:boya_invoice_app/screens/components/invoice_list_item_generator.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddInvoiceModal extends StatefulWidget {
  final Function(Invoice) onAddInvoice;
  final Function(Invoice) onSaveDraftInvoice;

  const AddInvoiceModal(
      {Key? key, required this.onAddInvoice, required this.onSaveDraftInvoice})
      : super(key: key);

  @override
  State<AddInvoiceModal> createState() => _AddInvoiceModalState();
}

class _AddInvoiceModalState extends State<AddInvoiceModal> {
  final TextEditingController _senderAddressTextEditingController =
      TextEditingController();
  final TextEditingController _senderCityTextEditingController =
      TextEditingController();
  final TextEditingController _senderPostCodeTextEditingController =
      TextEditingController();
  final TextEditingController _senderCountryTextEditingController =
      TextEditingController();
  final TextEditingController _clientNameTextEditingController =
      TextEditingController();
  final TextEditingController _clientEmailTextEditingController =
      TextEditingController();
  final TextEditingController _clientAddressTextEditingController =
      TextEditingController();
  final TextEditingController _clientCityTextEditingController =
      TextEditingController();
  final TextEditingController _clientPostCodeTextEditingController =
      TextEditingController();
  final TextEditingController _clientCountryTextEditingController =
      TextEditingController();
  final TextEditingController _invoiceIssueDateTextEditingController =
      TextEditingController();
  final TextEditingController _projectDescriptionTextEditingController =
      TextEditingController();
  String paymentTerms = 'Net 30 day';
  DateTime? invoiceDate;
  final List<TextEditingController> _itemNameTextEditingControllers = [];
  final List<TextEditingController> _qtyTextEditingControllers = [];
  final List<TextEditingController> _priceTextEditingControllers = [];
  final List<dynamic> _totals = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _senderAddressTextEditingController.dispose();
    _senderCityTextEditingController.dispose();
    _senderCountryTextEditingController.dispose();
    _senderPostCodeTextEditingController.dispose();
    _clientAddressTextEditingController.dispose();
    _clientCityTextEditingController.dispose();
    _clientCountryTextEditingController.dispose();
    _clientPostCodeTextEditingController.dispose();
    _clientEmailTextEditingController.dispose();
    _clientNameTextEditingController.dispose();
    _invoiceIssueDateTextEditingController.dispose();
    _projectDescriptionTextEditingController.dispose();
    for (var controller in _itemNameTextEditingControllers) {
      controller.dispose();
    }
    for (var controller in _priceTextEditingControllers) {
      controller.dispose();
    }
    for (var controller in _qtyTextEditingControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: AppColors.blue700,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: AppColors.blue700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'New Invoice',
                            style: AppTextStyles.kH2Light,
                          ),
                          BillingForms(
                            senderAddressTextEditingController:
                                _senderAddressTextEditingController,
                            senderCityTextEditingController:
                                _senderCityTextEditingController,
                            senderPostCodeTextEditingController:
                                _senderPostCodeTextEditingController,
                            senderCountryTextEditingController:
                                _senderCountryTextEditingController,
                            clientAddressTextEditingController:
                                _clientAddressTextEditingController,
                            clientCityTextEditingController:
                                _clientCityTextEditingController,
                            clientPostCodeTextEditingController:
                                _clientPostCodeTextEditingController,
                            clientCountryTextEditingController:
                                _clientCountryTextEditingController,
                            clientEmailTextEditingController:
                                _clientEmailTextEditingController,
                            clientNameTextEditingController:
                                _clientNameTextEditingController,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          currentDate: DateTime.now(),
                                          lastDate: DateTime(2101),
                                          firstDate: DateTime.now(),
                                          initialDate: DateTime.now())
                                      .then((date) {
                                    if (date != null) {
                                      _invoiceIssueDateTextEditingController
                                              .text =
                                          DateFormat.yMMMd().format(date);
                                      invoiceDate = date;
                                    }
                                  });
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: AppTextField(
                                    label: 'Issue Date',
                                    controller:
                                        _invoiceIssueDateTextEditingController,
                                    suffixIcon: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxHeight: 12.0,
                                          maxWidth: 12.0,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svgs/icon-calendar.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: AppDropDownFormField(
                                label: 'Payment Terms',
                                values: const [
                                  'Net 1 day',
                                  'Net 7 day',
                                  'Net 14 day',
                                  'Net 30 day',
                                ],
                                currentValue: paymentTerms,
                                onChange: (value) {
                                  setState(() {
                                    paymentTerms = value;
                                  });
                                },
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                              label: 'Project Description',
                              controller:
                                  _projectDescriptionTextEditingController),
                          InvoiceItemGenerator(
                            itemNameTextEditingControllers:
                                _itemNameTextEditingControllers,
                            qtyTextEditingControllers:
                                _qtyTextEditingControllers,
                            priceTextEditingControllers:
                                _priceTextEditingControllers,
                            totals: _totals,
                            onDelete: (index) {
                              setState(() {
                                _totals.removeAt(index);
                                _qtyTextEditingControllers.removeAt(index);
                                _priceTextEditingControllers.removeAt(index);
                                _itemNameTextEditingControllers.removeAt(index);
                              });
                            },
                          ),
                          ButtonWithHover(
                              textStyle: AppTextStyles.kB2,
                              onTap: () {
                                setState(() {
                                  _totals.add(0);
                                });
                              },
                              hoverColor: AppColors.grey500,
                              color: AppColors.blue600,
                              label: '+ Add New Item'),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InvoiceActionsForCreate(
                onDiscard: () {
                  Navigator.of(context).pop();
                },
                onSaveSend: () {
                  if (_formKey.currentState!.validate()) {
                    Invoice invoice = createInvoice('pending');
                    widget.onAddInvoice(invoice);
                    Navigator.of(context).pop();
                  }
                },
                onSaveAsDraft: () {
                  Invoice invoice = createInvoice('draft');
                  widget.onSaveDraftInvoice(invoice);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  Invoice createInvoice(String status){
    String invoiceId = generateID();
    List<Items> items = [];
    dynamic total = 0;
    for (int i = 0; i < _totals.length; i++) {
      dynamic price = double.parse(
          _priceTextEditingControllers[i].text.trim().isEmpty
              ? '0'
              : _priceTextEditingControllers[i].text.trim());
      dynamic qty = int.parse(
          _qtyTextEditingControllers[i].text.trim().isEmpty
              ? '0'
              : _qtyTextEditingControllers[i].text.trim());
      dynamic jointTotal = qty * price;
      items.add(Items(
          name: _itemNameTextEditingControllers[i].text.trim(),
          quantity: qty,
          price: price,
          total: jointTotal));
      total += jointTotal;
    }
    Invoice invoice = Invoice(
        id: invoiceId,
        createdAt: invoiceDate == null
            ? ''
            : DateFormat('yyyy-MM-dd').format(invoiceDate!),
        paymentDue: invoiceDate == null
            ? ''
            : DateFormat('yyyy-MM-dd').format(invoiceDate!
            .add(Duration(
            days: int.parse(paymentTerms.split(' ')[1])))),
        description:
        _projectDescriptionTextEditingController.text.trim(),
        paymentTerms: int.parse(paymentTerms.split(' ')[1]),
        clientName: _clientNameTextEditingController.text.trim(),
        clientEmail:
        _clientEmailTextEditingController.text.trim(),
        status: status,
        senderAddress: SenderAddress(
            street:
            _senderAddressTextEditingController.text.trim(),
            city: _senderCityTextEditingController.text.trim(),
            postCode:
            _senderPostCodeTextEditingController.text.trim(),
            country:
            _senderCountryTextEditingController.text.trim()),
        clientAddress: ClientAddress(
            street:
            _clientAddressTextEditingController.text.trim(),
            city: _clientCityTextEditingController.text.trim(),
            postCode:
            _clientPostCodeTextEditingController.text.trim(),
            country:
            _clientCountryTextEditingController.text.trim()),
        items: items,
        total: total);
    return  invoice;
  }
}
