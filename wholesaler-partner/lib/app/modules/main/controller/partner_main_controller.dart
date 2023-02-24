import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wholesaler_user/app/widgets/snackbar.dart';

class PartnerMainController extends GetxController {
  DateTime? currentBackPressTime;
  onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      mSnackbar(message: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.");
      return false;
    }
    SystemNavigator.pop();
    return true;

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
