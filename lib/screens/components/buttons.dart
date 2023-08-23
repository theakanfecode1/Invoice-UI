import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:boya_invoice_app/ui_helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWithIcon extends StatefulWidget {
  final VoidCallback onTap;

  const ButtonWithIcon({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ButtonWithIcon> createState() => _ButtonWithIconState();
}

class _ButtonWithIconState extends State<ButtonWithIcon> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHover: (value){
        setState(() {
          isHover = value;
        });      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10,right: 20,top: 8,bottom: 8),
        decoration: BoxDecoration(
            color: isHover ? AppColors.purple600 : AppColors.purple700,
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 15,
              child: SvgPicture.asset(
                'assets/svgs/icon-plus.svg',
              ),
            ),
            const SizedBox(width: 17,),
            const Text('New Invoice',style: AppTextStyles.kH3Lightx1,)
          ],
        ),
      ),
    );
  }
}

class ButtonWithHover extends StatefulWidget {
  final VoidCallback onTap;
  final Color hoverColor;
  final Color color;
  final String label;
  final TextStyle textStyle;

  const ButtonWithHover({Key? key, required this.onTap,this.textStyle = AppTextStyles.kH3Lightx1, required this.hoverColor, required this.color, required this.label}) : super(key: key);

  @override
  State<ButtonWithHover> createState() => _ButtonWithHoverState();
}

class _ButtonWithHoverState extends State<ButtonWithHover> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHover: (value){
        setState(() {
          isHover = value;
        });      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
        decoration: BoxDecoration(
            color: isHover ? widget.hoverColor :widget.color,
            borderRadius: BorderRadius.circular(50)),
        child: Text(widget.label,style: widget.textStyle,),
      ),
    );
  }
}
