import 'package:shopping/home_products/data/remote/model/explore_product_response.dart';
import 'package:shopping/home_products/data/remote/model/loved_shops_response.dart';
import 'package:shopping/home_products/data/remote/model/might_liked_product_response.dart';
import 'package:shopping/home_products/data/remote/model/new_brand_response.dart';
import 'package:shopping/home_products/data/remote/model/picked_for_you_response.dart';
import 'package:shopping/home_products/data/remote/model/recently_viewed_response.dart';
import 'package:shopping/home_products/data/remote/model/think_you_love_shop_response.dart';

class HomeProductsResponse {
  final List<RecentlyViewedResponse>? recentlyViewedList;

  final List<NewBrandResponse>? newBrandList;

  final List<MightLikedProductResponse>? mightLikedProductList;

  final List<PickedForYouResponse>? pickedForYouList;

  final List<ThinkYouLoveShopResponse>? thinkYouLoveShopList;

  final List<LovedShopsResponse>? lovedShopList;

  final List<ExploreProductResponse>? exploreProductList;

  const HomeProductsResponse({
    required this.exploreProductList,
    this.recentlyViewedList,
    this.newBrandList,
    this.mightLikedProductList,
    this.pickedForYouList,
    this.thinkYouLoveShopList,
    this.lovedShopList,
  });

  const HomeProductsResponse.empty() : this(exploreProductList: null);

  factory HomeProductsResponse.fromJson(Map<String, dynamic> json) {
    List<ExploreProductResponse>? exploreProductList;

    if (json['explore_products'] != null) {
      Iterable i = json['explore_products'];
      exploreProductList =
        List<ExploreProductResponse>.from(i.map((data) => ExploreProductResponse.fromJson(data)));
    }

    return HomeProductsResponse(
      exploreProductList: exploreProductList
    );
  }
}
