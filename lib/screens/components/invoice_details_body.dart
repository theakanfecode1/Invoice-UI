import 'package:boya_invoice_app/models/invoice.dart';
import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:boya_invoice_app/ui_helpers/utils.dart';
import 'package:flutter/material.dart';

class InvoiceDetailsBody extends StatelessWidget {
  final Invoice invoice;
  const InvoiceDetailsBody({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
          color: AppColors.blue600,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '#',
                      style: AppTextStyles.kH3grey600x2,
                      children: [
                        TextSpan(
                          text: invoice.id,
                          style: AppTextStyles.kH3Lightx2,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    invoice.description,
                    style: AppTextStyles.kB2,
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    invoice.senderAddress.street,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.senderAddress.city,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.senderAddress.postCode,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.senderAddress.country,
                    style: AppTextStyles.kB2,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Invoice Date',
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    formatDate(invoice.createdAt),
                    style: AppTextStyles.kH3Lightx2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Payment Due',
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    formatDate(invoice.paymentDue),
                    style: AppTextStyles.kH3Lightx2,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bill To',
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    invoice.clientName,
                    style: AppTextStyles.kH3Lightx2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    invoice.clientAddress.street,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.clientAddress.city,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.clientAddress.postCode,
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    invoice.clientAddress.country,
                    style: AppTextStyles.kB2,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Sent to',
                    style: AppTextStyles.kB2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    invoice.clientEmail,
                    style: AppTextStyles.kH3Lightx2,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.blue500,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              invoice.items.length + 1,
                                  (index) => Padding(
                                padding:  EdgeInsets.only(top:index != 0 ? 30.0:0),
                                child: Text(index == 0
                                    ? 'Item Name'
                                    : invoice.items[index-1].name,style: index == 0? AppTextStyles.kB2: AppTextStyles.kH3Lightx1 ,),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              invoice.items.length + 1,
                                  (index) => Padding(
                                padding:  EdgeInsets.only(top:index != 0 ? 30.0:0),
                                child: Text(index == 0
                                    ? 'QTY.'
                                    : invoice.items[index-1].quantity.toString(),style: index == 0? AppTextStyles.kB2: AppTextStyles.kH3Lightx1 ,),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                              invoice.items.length + 1,
                                  (index) => Padding(
                                padding:  EdgeInsets.only(top:index != 0 ? 30.0:0),
                                child: Text(index == 0
                                    ? 'Price'
                                    : '£${formatAmount(invoice.items[index-1].price)}',style: index == 0? AppTextStyles.kB2: AppTextStyles.kH3Lightx1 ,),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                              invoice.items.length + 1,
                                  (index) => Padding(
                                padding:  EdgeInsets.only(top:index != 0 ? 30.0:0),
                                child: Text(index == 0
                                    ? 'Total'
                                    : '£${formatAmount(invoice.items[index-1].total)}',style: index == 0? AppTextStyles.kB2: AppTextStyles.kH3Lightx1 ,),
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                      color: AppColors.black600,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    children: [
                      const Text(
                        'Amount Due',
                        style: AppTextStyles.kB2,
                      ),
                      const Spacer(),
                      Text(
                        '£${formatAmount(invoice.total)}',
                        style: AppTextStyles.kH2Light,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
