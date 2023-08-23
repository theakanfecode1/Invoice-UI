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

class EditInvoiceModal extends StatefulWidget {
  final Invoice invoice;
  final Function(Invoice) onSaveInvoice;

  const EditInvoiceModal(
      {Key? key, required this.onSaveInvoice, required this.invoice})
      : super(key: key);

  @override
  State<EditInvoiceModal> createState() => _EditInvoiceModalState();
}

class _EditInvoiceModalState extends State<EditInvoiceModal> {
  late TextEditingController _senderAddressTextEditingController;
  late TextEditingController _senderCityTextEditingController;
  late TextEditingController _senderPostCodeTextEditingController;
  late TextEditingController _senderCountryTextEditingController;

  late TextEditingController _clientNameTextEditingController;

  late TextEditingController _clientEmailTextEditingController;

  late TextEditingController _clientAddressTextEditingController;

  late TextEditingController _clientCityTextEditingController;

  late TextEditingController _clientPostCodeTextEditingController;

  late TextEditingController _clientCountryTextEditingController;

  late TextEditingController _invoiceIssueDateTextEditingController;

  late TextEditingController _projectDescriptionTextEditingController;

  String _paymentTerms = 'Net 30 day';
  DateTime? _invoiceDate;
  final List<TextEditingController> _itemNameTextEditingControllers = [];
  final List<TextEditingController> _qtyTextEditingControllers = [];
  final List<TextEditingController> _priceTextEditingControllers = [];
  final List<dynamic> _totals = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _senderAddressTextEditingController =
        TextEditingController(text: widget.invoice.senderAddress.street);
    _senderCityTextEditingController =
        TextEditingController(text: widget.invoice.senderAddress.city);
    _senderCountryTextEditingController =
        TextEditingController(text: widget.invoice.senderAddress.country);
    _senderPostCodeTextEditingController =
        TextEditingController(text: widget.invoice.senderAddress.postCode);
    _clientEmailTextEditingController =
        TextEditingController(text: widget.invoice.clientEmail);
    _clientNameTextEditingController =
        TextEditingController(text: widget.invoice.clientName);
    _clientAddressTextEditingController =
        TextEditingController(text: widget.invoice.clientAddress.street);
    _clientCityTextEditingController =
        TextEditingController(text: widget.invoice.clientAddress.city);
    _clientCountryTextEditingController =
        TextEditingController(text: widget.invoice.clientAddress.country);
    _clientPostCodeTextEditingController =
        TextEditingController(text: widget.invoice.clientAddress.postCode);
    _invoiceIssueDateTextEditingController = TextEditingController(
        text: widget.invoice.createdAt.isEmpty
            ? ''
            : formatDate(widget.invoice.createdAt));
    if (widget.invoice.createdAt.isNotEmpty) {
      _invoiceDate = DateTime.parse(widget.invoice.createdAt);
    }
    _projectDescriptionTextEditingController =
        TextEditingController(text: widget.invoice.description);
    _paymentTerms = 'Net ${widget.invoice.paymentTerms} day';
    for (int i = 0; i < widget.invoice.items.length; i++) {
      _totals.add(0);
      _itemNameTextEditingControllers
          .add(TextEditingController(text: widget.invoice.items[i].name));
      _qtyTextEditingControllers.add(TextEditingController(
          text: widget.invoice.items[i].quantity.toString()));
      _priceTextEditingControllers.add(TextEditingController(
          text: widget.invoice.items[i].price.toString()));
    }

    super.initState();
  }

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
                          Text.rich(
                            TextSpan(
                              text: 'Edit ',
                              style: AppTextStyles.kH2Light,
                              children: [
                                const TextSpan(
                                  text: '#',
                                  style: AppTextStyles.kH2grey600,
                                ),
                                TextSpan(
                                  text: widget.invoice.id,
                                  style: AppTextStyles.kH2Light,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
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
                                      _invoiceDate = date;
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
                                currentValue: _paymentTerms,
                                onChange: (value) {
                                  setState(() {
                                    _paymentTerms = value;
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
              InvoiceActionsForEdit(
                onCancel: () {
                  Navigator.of(context).pop();
                },
                onSaveChanges: () {
                  if (_formKey.currentState!.validate()) {
                    String invoiceId = widget.invoice.id;
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
                        createdAt: _invoiceDate == null
                            ? ''
                            : DateFormat('yyyy-MM-dd').format(_invoiceDate!),
                        paymentDue: _invoiceDate == null
                            ? ''
                            : DateFormat('yyyy-MM-dd').format(_invoiceDate!
                            .add(Duration(
                            days: int.parse(_paymentTerms.split(' ')[1])))),
                        description: _projectDescriptionTextEditingController
                            .text
                            .trim(),
                        paymentTerms: int.parse(_paymentTerms.split(' ')[1]),
                        clientName:
                            _clientNameTextEditingController.text.trim(),
                        clientEmail:
                            _clientEmailTextEditingController.text.trim(),
                        status: widget.invoice.status == 'draft'
                            ? 'pending'
                            : widget.invoice.status,
                        senderAddress: SenderAddress(
                            street:
                                _senderAddressTextEditingController.text.trim(),
                            city: _senderCityTextEditingController.text.trim(),
                            postCode: _senderPostCodeTextEditingController.text
                                .trim(),
                            country: _senderCountryTextEditingController.text
                                .trim()),
                        clientAddress: ClientAddress(
                            street:
                                _clientAddressTextEditingController.text.trim(),
                            city: _clientCityTextEditingController.text.trim(),
                            postCode: _clientPostCodeTextEditingController.text
                                .trim(),
                            country: _clientCountryTextEditingController.text
                                .trim()),
                        items: items,
                        total: total);
                    widget.onSaveInvoice(invoice);
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
