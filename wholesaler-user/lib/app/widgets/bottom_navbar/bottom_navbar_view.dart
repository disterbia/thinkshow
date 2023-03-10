import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/modules/main/controllers/user_main_controller.dart';

class UserBottomNavbarView extends StatelessWidget {
  UserMainController userMainCtr = Get.put(UserMainController());
  UserBottomNavbarView();

  double iconSize = 25;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: userMainCtr.tabIndex.value,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.black,
      onTap: userMainCtr.changeTabIndex,
      items: <BottomNavigationBarItem>[
        ItemBuilder('홈', 'assets/icons/ic_home.png', 'assets/icons/ic_home_grey.png', 0),
        ItemBuilder('스토어', 'assets/icons/ic_store.png', 'assets/icons/ic_store_grey.png', 1),
        ItemBuilder('모아보기', 'assets/icons/ic_moabogi.png', 'assets/icons/ic_moabogi_grey.png', 2),
        ItemBuilder('찜', 'assets/icons/ic_heart_empty.png', 'assets/icons/ic_heart_empty_grey.png', 3),
        ItemBuilder('마이페이지', 'assets/icons/ic_my_page.png', 'assets/icons/ic_my_page_grey.png', 4),
      ],
    );
  }

  BottomNavigationBarItem ItemBuilder(String label, String imgSelected, String imgNotSelected, int itemIndex) {
    return BottomNavigationBarItem(
      icon: userMainCtr.tabIndex.value == itemIndex
          ? Image.asset(
              imgSelected,
              width: 24,
            )
          : Image.asset(
              imgNotSelected,
              width: 24,
            ),
      label: label,
    );
  }
}
