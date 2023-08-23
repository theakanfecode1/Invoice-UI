import 'package:boya_invoice_app/screens/components/app_textfield.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class BillingForms extends StatelessWidget {
  final TextEditingController senderAddressTextEditingController;
  final TextEditingController senderCityTextEditingController;
  final TextEditingController senderPostCodeTextEditingController;
  final TextEditingController senderCountryTextEditingController;
  final TextEditingController clientNameTextEditingController;
  final TextEditingController clientEmailTextEditingController;
  final TextEditingController clientAddressTextEditingController;
  final TextEditingController clientCityTextEditingController;
  final TextEditingController clientPostCodeTextEditingController;
  final TextEditingController clientCountryTextEditingController;
  const BillingForms({Key? key, required this.senderAddressTextEditingController, required this.senderCityTextEditingController, required this.senderPostCodeTextEditingController, required this.senderCountryTextEditingController, required this.clientNameTextEditingController, required this.clientEmailTextEditingController, required this.clientAddressTextEditingController, required this.clientCityTextEditingController, required this.clientPostCodeTextEditingController, required this.clientCountryTextEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Bill From',
          style: AppTextStyles.kH3purple700x1,
        ),
        const SizedBox(
          height: 20,
        ),
        AppTextField(
          label: 'Street Address',
          controller: senderAddressTextEditingController,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: AppTextField(
                  label: 'City',
                  controller: senderCityTextEditingController,
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: AppTextField(
                  label: 'Post Code',
                  controller: senderPostCodeTextEditingController,
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: AppTextField(
                  label: 'Country',
                  controller: senderCountryTextEditingController,
                ))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Bill To',
          style: AppTextStyles.kH3purple700x1,
        ),
        const SizedBox(
          height: 20,
        ),
        AppTextField(
          label: 'Client\'s Name',
          controller: clientNameTextEditingController,
        ),
        const SizedBox(
          height: 20,
        ),
        AppTextField(
          label: 'Client\'s Email',
          controller: clientEmailTextEditingController,
          hint: 'e.g. email@example.com',
        ),
        const SizedBox(
          height: 20,
        ),
        AppTextField(
            label: 'Street Address',
          controller: clientAddressTextEditingController,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: AppTextField(
                  label: 'City',
                  controller: clientCityTextEditingController,
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: AppTextField(
                  label: 'Post Code',
                  controller: clientPostCodeTextEditingController,
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: AppTextField(
                  label: 'Country',
                  controller: clientCountryTextEditingController,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
