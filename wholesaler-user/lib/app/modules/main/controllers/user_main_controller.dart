import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/constants/enum.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/modules/auth/user_login_page/views/user_login_view.dart';
import 'package:wholesaler_user/app/modules/page4_favorite_products/controllers/page4_favorite_products_controller.dart';

class UserMainController extends GetxController {
  // RxInt selectedIndex = 0.obs;

  // void onItemTapped(int index) {
  //   // setState(() {
  //   tabIndex.value = index;
  //   // });
  // }

  RxInt tabIndex = UseBottomNavTabs.home.index.obs;
  // Rx<ListQueue> navigationQueue = ListQueue().obs;

  @override
  void onInit() {
    super.onInit();
    // navigationQueue.value.addLast(UseBottomNavTabs.home.index);
  }

  void changeTabIndex(int index) {
    if (index == UseBottomNavTabs.favorites.index || index == UseBottomNavTabs.my_page.index) {
      // check if user is logged in
      if (CacheProvider().getToken().isEmpty) {
        Get.to(() => User_LoginPageView());
        return;
      }
      // Get.delete<Page4Favorite_RecentlyViewedController>(); // If we don't delete, the title would be 최근본사품 instead of 찜
    }
    // navigationQueue.value.addLast(index);
    tabIndex.value = index;
    update();
  }

  onWillPop() async {
    // if (navigationQueue.value.length == 1) {
    //   exit(0);
    // } else {
    //   navigationQueue.value.removeLast();
    //   tabIndex.value = navigationQueue.value.last;
    //   update();
    //   return false;
    // }
  }
}
