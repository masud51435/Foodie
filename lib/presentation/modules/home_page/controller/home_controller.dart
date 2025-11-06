import 'package:foodie/backend/public_api.dart';
import 'package:foodie/presentation/model/banner_response_model.dart';
import 'package:foodie/presentation/model/campaign_response_model.dart';
import 'package:foodie/presentation/model/categories_response_model.dart';
import 'package:foodie/presentation/model/popular_response_model.dart';
import 'package:foodie/presentation/model/resturants_response_model.dart';
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
    fetchBanners();
    fetchCategories();
    fetchPopularFoods();
    fetchCampaigns();
    fetchAllRestaurants(offset: restaurantPage);
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
    if (offset == 1) {
      restaurantsLoading.value = true;
    } else {
      restaurantsPaginating.value = true;
    }
    try {
      if (!hasMoreRestaurants) return;
      final restaurantsResponse = await publicApi.allRestaurants(
        offset: offset,
        limit: 10,
      );
      if (restaurantsResponse.restaurants?.isNotEmpty ?? false) {
        allRestaurants.addAll(restaurantsResponse.restaurants ?? []);
        restaurantPage++;
        if ((restaurantsResponse.restaurants?.length ?? 0) < 10) {
          hasMoreRestaurants = false;
        }
      } else {
        hasMoreRestaurants = false;
      }
    } catch (e) {
    } finally {
      if (offset == 1) {
        restaurantsLoading.value = false;
      } else {
        restaurantsPaginating.value = false;
      }
    }
  }
}
