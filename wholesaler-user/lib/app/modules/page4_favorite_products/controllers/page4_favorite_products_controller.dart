import 'package:get/get.dart';
import 'package:wholesaler_user/app/data/api_provider.dart';
import 'package:wholesaler_user/app/data/cache_provider.dart';
import 'package:wholesaler_user/app/models/product_model.dart';

class Page4Favorite_RecentlyViewedController extends GetxController {
  bool isRecentSeenProduct = false;
  uApiProvider _apiProvider = uApiProvider();
  CacheProvider _cacheProvider = CacheProvider();

  RxList<Product> products = <Product>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  updateProducts() async {
    products.clear();

    if (isRecentSeenProduct) {
      // Recently Seen Products
      List productIds = _cacheProvider.getAllRecentlyViewedProducts();
      print('sajad productIds ${productIds}');
      if (productIds.isNotEmpty) {
        products.value = await _apiProvider.getRecentlySeenProducts(productIds);
      }
    } else {
      // Favorite Products
      products.value = await _apiProvider.getFavoriteProducts();
    }
  }
}
