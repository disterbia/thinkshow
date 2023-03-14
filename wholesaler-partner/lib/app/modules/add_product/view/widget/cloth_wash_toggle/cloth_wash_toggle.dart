import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/modules/add_product/view/widget/cloth_wash_toggle/cloth_wash_model.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/dimens.dart';

class ClothWashToggle extends StatelessWidget {
  ClothWash clothWash;
  VoidCallback onPressed;
  ClothWashToggle({required this.clothWash, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              color: clothWash.isActive.value ? MyColors.primary : MyColors.white,
              borderRadius: BorderRadius.all(Radius.circular(MyDimensions.radius)),
              border: Border.all(
                color: clothWash.isActive.value ? MyColors.primary : MyColors.grey1,
              ),
            ),
            height: 10.h,
            width: 20.w,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset(
                      clothWash.iconPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: Text(
                      clothWash.title,
                      style: TextStyle(color: clothWash.isActive.value ? MyColors.black2 : MyColors.black2, fontSize: 12.sp),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
