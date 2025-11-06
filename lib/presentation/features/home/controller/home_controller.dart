import 'package:foodie/backend/public_api.dart';
import 'package:foodie/data/models/banner_response_model.dart';
import 'package:foodie/data/models/campaign_response_model.dart';
import 'package:foodie/data/models/categories_response_model.dart';
import 'package:foodie/data/models/popular_response_model.dart';
import 'package:foodie/data/models/resturants_response_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PublicApi publicApi;

  HomeController({required this.publicApi});

  RxBool bannerLoading = false.obs;
  RxBool categoryLoading = false.obs;
  RxBool campaignLoading = false.obs;
  RxBool popularFoodLoading = false.obs;
  RxBool restaurantsLoading = false.obs;
  RxBool restaurantsPaginating = false.obs;

  RxList<Banner> allBanners = <Banner>[].obs;
  RxList<CategoriesResponseModel> allCategories =
      <CategoriesResponseModel>[].obs;
  RxList<Product> popularFoods = <Product>[].obs;
  RxList<CampaignResponseModel> allCampaigns = <CampaignResponseModel>[].obs;
  RxList<Restaurant> allRestaurants = <Restaurant>[].obs;

  RxInt currentPageIndex = 0.obs;
  int restaurantPage = 1;
  bool hasMoreRestaurants = true;

  @override
  void onInit() {
    super.onInit();
    refreshAll();
  }

  Future<void> refreshAll() async {
    await Future.wait([
      fetchBanners(),
      fetchCategories(),
      fetchPopularFoods(),
      fetchCampaigns(),
      fetchAllRestaurants(offset: restaurantPage),
    ]);
  }

  void updatePageIndicator(index) => currentPageIndex.value = index;

  Future<void> fetchBanners() async {
    bannerLoading.value = true;
    try {
      final bannerResponse = await publicApi.allBanners();
      if (bannerResponse.banners?.isNotEmpty ?? false) {
        allBanners.value = bannerResponse.banners ?? [];
      }
    } catch (e) {
    } finally {
      bannerLoading.value = false;
    }
  }

  Future<void> fetchCategories() async {
    categoryLoading.value = true;
    try {
      final categoryResponse = await publicApi.allCategories();
      if (categoryResponse.isNotEmpty) {
        allCategories.value = categoryResponse;
      }
    } catch (e) {
    } finally {
      categoryLoading.value = false;
    }
  }

  Future<void> fetchPopularFoods() async {
    popularFoodLoading.value = true;
    try {
      final popularFoodResponse = await publicApi.popularFoods();
      if (popularFoodResponse.products?.isNotEmpty ?? false) {
        popularFoods.value = popularFoodResponse.products ?? [];
      }
    } catch (e) {
    } finally {
      popularFoodLoading.value = false;
    }
  }

  Future<void> fetchCampaigns() async {
    campaignLoading.value = true;
    try {
      final campaignResponse = await publicApi.allCampaigns();
      if (campaignResponse.isNotEmpty) {
        allCampaigns.value = campaignResponse;
      }
    } catch (e) {
    } finally {
      campaignLoading.value = false;
    }
  }

  Future<void> fetchAllRestaurants({required int offset}) async {
    if (restaurantsLoading.value || restaurantsPaginating.value) return;
    if (!hasMoreRestaurants) return;

    if (offset == 1) {
      restaurantsLoading.value = true;
    } else {
      restaurantsPaginating.value = true;
    }

    try {
      final restaurantsResponse = await publicApi.allRestaurants(
        offset: offset,
        limit: 10,
      );

      final newRestaurants = restaurantsResponse.restaurants ?? [];
      if (newRestaurants.isNotEmpty) {
        allRestaurants.addAll(newRestaurants);
        restaurantPage++;
        if (newRestaurants.length < 10) hasMoreRestaurants = false;
      } else {
        hasMoreRestaurants = false;
      }
    } catch (e) {
    } finally {
      restaurantsLoading.value = false;
      restaurantsPaginating.value = false;
    }
  }
}
