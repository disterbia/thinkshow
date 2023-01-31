import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/styles.dart';
import 'package:wholesaler_user/app/models/store_model.dart';
import 'package:wholesaler_user/app/modules/main/controllers/user_main_controller.dart';
import 'package:wholesaler_user/app/modules/page2_store_detail/view/store_detail_view.dart';
import 'package:wholesaler_user/app/modules/page2_store_list/controllers/shopping_controller.dart';
import 'package:wholesaler_user/app/modules/page2_store_list/controllers/shopping_controller2.dart';
import 'package:wholesaler_user/app/modules/page2_store_list/views/tabs/tab1_ranking_view.dart';

class Tab2BookmarksView extends StatelessWidget {
  Page2StoreListController2 ctr = Get.put(Page2StoreListController2());

  String? prevPage = "bookmark";

  @override
  Widget build(BuildContext context) {
    ctr.getBookmarkedStoreData();
    return Obx(
            () => ctr.isLoading.value
                ? LoadingWidget():
            ctr.stores.length == 0
                ? Container(
              child: Column(children: [
                Text(
                  "!느낌표이미지!",
                ),
                Text("아직 즐겨찾기를 한 스토어가 없어요"),
                Text("랭킹에서 즐겨찾기를 해보세요"),
                InkWell(
                    onTap: () => Get.find<UserMainController>().changeTabIndex(1),
                    child: Container(
                        width: Get.width * 0.6,
                        color: MyColors.grey3,
                        height: 50,
                        child: Center(child: Text("스토어 구경하러 가기"))))
              ]),
            )
                : ListView.builder(
                    itemCount: ctr.stores.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(ctr.stores[index].topImagePath);
                      return _storeList(ctr.stores[index]);
                    }),
          );
  }

  Widget _storeList(Store store) {
    return GestureDetector(
      onTap: () {
        Get.to(() => StoreDetailView(
              storeId: store.id,
              prevPage: prevPage,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: MyColors.grey6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                _storeRankNum(store),
                SizedBox(width: 10),
                _storeImage(store),
                SizedBox(width: 10),
                _storeName(store),
                Spacer(),
                _starBuilder(store),
              ]),
              // Container(height: Get.height/6,
              //   child: ListView.separated(physics: NeverScrollableScrollPhysics(),
              //       itemCount: 4,
              //       scrollDirection: Axis.horizontal,
              //       separatorBuilder:(context, index) => SizedBox(width:2 ,) ,
              //       itemBuilder: (context, index) {
              //         if(store.topImagePath!.length<4){
              //           return Container();
              //         }
              //       return CachedNetworkImage(imageUrl: store.topImagePath![index],width: (Get.width/4)-10,);
              //
              //     },),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _storeRankNum(Store store) {
    return Text(
      store.rank.toString(),
      style: MyTextStyles.f16.copyWith(color: MyColors.grey8),
    );
  }

  Widget _storeImage(Store store) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: store.imgUrl != null
          ? CachedNetworkImage(
              imageUrl: store.imgUrl!.value,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : Image.asset(
              'assets/icons/ic_store.png',
              width: 50,
            ),
    );
  }

  Widget _storeName(Store store) {
    return Text(
      store.name!,
      style: MyTextStyles.f16.copyWith(color: MyColors.black3),
    );
  }

  Widget _starBuilder(Store store) {
    return InkWell(
      onTap: () async {
        store.isBookmarked!.toggle();
        await ctr.starIconPressed(store);
        await ctr.getBookmarkedStoreData();
      },
      child: Obx(
        () => Icon(
          size: 30,
          store.isBookmarked!.isTrue ? Icons.star : Icons.star_border,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
