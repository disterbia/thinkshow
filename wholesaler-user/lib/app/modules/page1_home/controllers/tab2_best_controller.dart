import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/Constants/constants.dart';
import 'package:wholesaler_user/app/data/api_provider.dart';
import 'package:wholesaler_user/app/models/product_model.dart';
import 'package:wholesaler_user/app/widgets/category_tags/category_tag_controller.dart';

class Tab2BestController extends GetxController {
  CategoryTagController categoryTagCtr = Get.put(CategoryTagController());
  uApiProvider _apiProvider = uApiProvider();
  RxList<Product> products = <Product>[].obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxBool allowCallAPI = false.obs;

  /// WARNING: [apiSoftItems] and [dropdownItems]: if one is changed, the other one should also be changed.
  List<String> apiSoftItems = ['total', 'daily', 'weekly', 'lowPrice', 'highPrice'];
  List<String> dropdownItems = ['전체', '일간베스트', '주간베스트', '낮은가격순', '높은가격순'];
  RxInt selectedDropdownIndex = 0.obs;

  @override
  Future<void> onInit() async {
    products.value = await _apiProvider.getBestProductsWithALL(sort: apiSoftItems[categoryTagCtr.selectedMainCatIndex.value]);
    super.onInit();
  }

  Future<void> updateProducts() async {
    print('sajad inside updateProducts: categoryTagCtr selectedIndex ${categoryTagCtr.selectedMainCatIndex.value}');
    // Note: we have two APIs. API 1: When "ALL" chip is called (index == 0), API 2: when categories are called.
    if (categoryTagCtr.selectedMainCatIndex.value == 0) {
      print('sajad index 0, show ALL');
      products.value = await _apiProvider.getBestProductsWithALL(sort: apiSoftItems[selectedDropdownIndex.value]);
    } else {
      print('sajad index > 0 , show categories');
      products.value = await _apiProvider.getBestProductsWithCat(categoryId: categoryTagCtr.selectedMainCatIndex.value, sort: apiSoftItems[selectedDropdownIndex.value]);
    }
  }
}
