import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesaler_partner/app/widgets/loading_widget.dart';
import 'package:wholesaler_user/app/constants/colors.dart';
import 'package:wholesaler_user/app/constants/dimens.dart';
import 'package:wholesaler_user/app/modules/page1_home/models/image_banner_model.dart';
import 'package:wholesaler_user/app/widgets/image_slider/controller/image_slider_controller.dart';

import '../../../modules/page3_exhibition_products/view/exhibition_products_view.dart';

class ImageSliderView extends GetView<ImageSliderController> {
  ImageSliderController ctr = Get.put(ImageSliderController());

  CurrentPage currentPage;
  ImageSliderView(this.currentPage);
  @override
  Widget build(BuildContext context) {
    ctr.getBannerImageAPI(currentPage);
    return Stack(children: [
      Obx(
        () => CarouselSlider(
          carouselController: ctr.sliderController,
          items: [
            for (ImageBannerModel image in ctr.imageBannerModel)
              GestureDetector(
                onTap: () {
                  if (currentPage != CurrentPage.dingDongPage) {
                    Get.to(() => ExhibitionProductsView(), arguments: {'imageId': image.id});
                  }
                },
                child: Container(
                  width: 411.w,
                  child: ExtendedImage.network(
                  cacheHeight: 1024,
                  cacheWidth: 1024,
                  clearMemoryCacheWhenDispose:true,
                  enableMemoryCache: false,
                  enableLoadState: false,
                 image.banner_img_url,
                    fit: BoxFit.fill,
                    // //cacheHeight:411.w.ceil(),
                    // //cacheWidth:411.w.ceil() ,
                    // placeholder: (context, url) => CircularProgressIndicator(),

                  ),
                ),
              ),
          ],
          options: CarouselOptions(
            pageSnapping: true,
            onPageChanged: (index, reason) {
              ctr.mainSliderIndex.value = index;
            },
            autoPlay: true,autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1,
            height: 411.w*0.56
          ),
        ),
      ),
      Obx(
        () => Positioned(
          bottom: 3,
          right: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(color: MyColors.black.withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(MyDimensions.circle))),
              child: Center(
                child: Text(
                  '${(ctr.mainSliderIndex.value) + 1}/${ctr.imageBannerModel.length}',
                  style: TextStyle(color: MyColors.white),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
