import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String hint;
  final double horizontalPadding;
  final TextEditingController controller;
  final TextAlign textAlign;
  final double width;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool showCollapseIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onTextChanged;
  final List<TextInputFormatter> inputFormatter;

  const AppTextField(
      {Key? key,
       this.label= '',
        this.hint = '',
        this.horizontalPadding = 20,
        this.textAlign = TextAlign.left,
        required this.controller,
        this.enabled = true,
        this.obscureText = false,
        this.showCollapseIcon = false,
        this.suffixIcon,
        this.width = double.infinity,
        this.keyboardType = TextInputType.text,
        this.validator,
        this.onTextChanged,
        this.inputFormatter = const [],
        this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label!.isNotEmpty)Text(
          label!,
          style: AppTextStyles.kB2,
        ),
        if(label!.isNotEmpty)const SizedBox(height: 8,),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.white,
          textAlignVertical: TextAlignVertical.bottom,
          textAlign: textAlign,
          maxLines: 1,
          style:  AppTextStyles.kB1,
          enabled: enabled,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          validator: (text){
            if(text == null || text.trim().isEmpty){
              return 'This field is required';
            }
            return null;
          },
          inputFormatters: inputFormatter,
          onChanged: onTextChanged,
          decoration: InputDecoration(
            filled: true,
            contentPadding:
             EdgeInsets.symmetric(vertical: 18, horizontal: horizontalPadding),
            isDense: true,
            isCollapsed: true,
            fillColor: AppColors.blue600,
            hintText: hint,
            suffixIcon: suffixIcon,
            errorMaxLines: 3,
            hintStyle: AppTextStyles.kB1,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.orange600, style: BorderStyle.solid,width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: AppColors.orange600, style: BorderStyle.solid,width: 1)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: AppColors.blue500,
                style: BorderStyle.solid,width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
class AppDropDownFormField extends StatelessWidget {
  final List<String> values;
  final String currentValue;
  final Function(dynamic) onChange;
  final String label;
  const AppDropDownFormField({Key? key, required this.values, required this.currentValue, required this.onChange, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.kB2,
        ),
        const SizedBox(height: 8,),
        SizedBox(
          height: 40,
          child: DropdownButtonFormField(
            items: values.map((String item) {
              return  DropdownMenuItem(
                  value: item,
                  child: Text(item,style:AppTextStyles.kB1,)
              );
            }).toList(),
            onChanged: onChange,
            value: currentValue,
            dropdownColor: AppColors.blue700,
            style:  AppTextStyles.kB1,
            icon: SvgPicture.asset(
              'assets/svgs/icon-arrow-down.svg',
            ),
            iconSize: 20,
            decoration: InputDecoration(
              filled: true,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20),
              fillColor: AppColors.blue600,
              errorMaxLines: 3,
              hintStyle: AppTextStyles.kB1,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      color: AppColors.blue500, style: BorderStyle.solid,width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      color: AppColors.orange600, style: BorderStyle.solid,width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      color: AppColors.orange600, style: BorderStyle.solid,width: 1)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: AppColors.blue500,
                  style: BorderStyle.solid,width: 1,
                ),
              ),
            ),

          ),
        ),
      ],
    );
  }
}
