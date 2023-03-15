import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/modules/page1_home/controller/partner_home_controller.dart';
import 'package:wholesaler_user/app/constants/variables.dart';
import 'package:wholesaler_user/app/widgets/dingdong_3products_horiz/dingdong_3products_horiz_controller.dart';
import 'package:wholesaler_user/app/widgets/product/product_item_vertical_widget.dart';

class Dingdong3ProductsHorizView extends GetView<Dingdong3ProductsHorizController> {
  Dingdong3ProductsHorizController ctr = Get.put(Dingdong3ProductsHorizController());

  Dingdong3ProductsHorizView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        height:MyVars.isIpad()?350.h:240.h,
        //MyVars.isIpad()?450:240,
        child: Obx(
          () => ctr.dingDongProducts.isNotEmpty
              ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: false,
                  itemCount: ctr.dingDongProducts.length,
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 10.w),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: (411 / 3 - 25).w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MyVars.isSmallPhone() ? 3 : 3),
                        child: ProductItemVertical(
                          product: ctr.dingDongProducts.elementAt(index),
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('제품을 등록해주세요.')),
        ),
      ),
    );
  }
}
