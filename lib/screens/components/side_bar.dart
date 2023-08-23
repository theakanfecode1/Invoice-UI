import 'package:boya_invoice_app/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      decoration:const BoxDecoration(
          color: AppColors.blue600,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 105,
            decoration:const BoxDecoration(
                color: AppColors.purple700,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(20))
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom:0,
                  child: Container(
                    width: 100,
                    height: 52,
                    decoration:const BoxDecoration(
                        color: AppColors.purple600,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),),
                ),
                SvgPicture.asset('assets/svgs/logo.svg',width: 42,),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset('assets/svgs/icon-sun.svg',),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 100,
            height: 0.2,
            color: AppColors.grey700,
          ),
          const SizedBox(
            height: 25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/image-avatar.jpg',width: 38,),
          ),
          const SizedBox(
            height: 30,
          ),


        ],
      ),
    );
  }
}
