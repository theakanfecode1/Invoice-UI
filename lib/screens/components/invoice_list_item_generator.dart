import 'package:boya_invoice_app/screens/components/app_textfield.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceItemGenerator extends StatefulWidget {
  final List<TextEditingController> itemNameTextEditingControllers;
  final List<TextEditingController> qtyTextEditingControllers;
  final List<TextEditingController> priceTextEditingControllers;
  final List<dynamic> totals;
  final Function(int) onDelete;

  const InvoiceItemGenerator(
      {Key? key,
      required this.itemNameTextEditingControllers,
      required this.qtyTextEditingControllers,
      required this.priceTextEditingControllers,
      required this.totals,
      required this.onDelete})
      : super(key: key);

  @override
  State<InvoiceItemGenerator> createState() => _InvoiceItemGeneratorState();
}

class _InvoiceItemGeneratorState extends State<InvoiceItemGenerator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Item List',
          style: AppTextStyles.kH3grey600x2,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.totals.length + 1, (index) {
                  if (index > 0) {
                    widget.itemNameTextEditingControllers
                        .add(TextEditingController());
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: index != 0 ? 20.0 : 0),
                    child: index == 0
                        ? const Text(
                            'Item Name',
                            style: AppTextStyles.kB2,
                          )
                        : AppTextField(
                            controller: widget
                                .itemNameTextEditingControllers[index - 1]),
                  );
                }),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.totals.length + 1, (index) {
                  if (index > 0) {
                    widget.qtyTextEditingControllers
                        .add(TextEditingController());
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: index != 0 ? 20.0 : 0),
                    child: index == 0
                        ? const Text(
                            'Qty.',
                            style: AppTextStyles.kB2,
                          )
                        : AppTextField(
                            controller:
                                widget.qtyTextEditingControllers[index - 1],
                            keyboardType: TextInputType.number,
                      onTextChanged: (text) {
                        setState(() {});
                      },
                            textAlign: TextAlign.center,
                            horizontalPadding: 10,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                  );
                }),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.totals.length + 1, (index) {
                  if (index > 0) {
                    widget.priceTextEditingControllers
                        .add(TextEditingController());
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: index != 0 ? 20.0 : 0),
                    child: index == 0
                        ? const Text(
                            'Price',
                            style: AppTextStyles.kB2,
                          )
                        : AppTextField(
                            controller:
                                widget.priceTextEditingControllers[index - 1],
                            horizontalPadding: 15.0,
                            onTextChanged: (text) {
                              setState(() {});
                            },
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true)),
                  );
                }),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                    widget.totals.length + 1,
                    (index) => Padding(
                          padding: EdgeInsets.only(top: index != 0 ? 20.0 : 0),
                          child: SizedBox(
                            height: index != 0 ? 40.0 : null,
                            child: Center(
                              child: Text(
                                index == 0
                                    ? 'Total'
                                    : '£${widget.priceTextEditingControllers[index - 1].text.trim().isEmpty ? '0.00' : formatAmount(double.parse(widget.priceTextEditingControllers[index - 1].text.trim()) * int.parse(widget.qtyTextEditingControllers[index - 1].text.trim().isEmpty ? '1' : widget.qtyTextEditingControllers[index - 1].text.trim()))}',
                                style: index == 0
                                    ? AppTextStyles.kB2
                                    : AppTextStyles.kH3Lightx1,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                    widget.totals.length + 1,
                    (index) => Padding(
                          padding: EdgeInsets.only(top: index != 0 ? 20.0 : 0),
                          child: index == 0
                              ? const SizedBox(
                                  height: 10,
                                )
                              : InkWell(
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  onTap: () {
                                    widget.onDelete(index - 1);
                                  },
                                  child: SizedBox(
                                    height: 40.0,
                                    child: Center(
                                      child: SvgPicture.asset(
                                          'assets/svgs/icon-delete.svg'),
                                    ),
                                  ),
                                ),
                        )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
