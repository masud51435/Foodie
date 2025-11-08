import 'package:flutter/material.dart';
import 'package:foodie/backend/public_api.dart';
import 'package:foodie/data/models/campaign_response_model.dart';
import 'package:foodie/data/models/categories_response_model.dart';
import 'package:foodie/data/models/config_response_model.dart';
import 'package:foodie/data/models/popular_response_model.dart';
import 'package:foodie/data/models/resturants_response_model.dart';
import 'package:get/get.dart';

import '../../../../data/models/banner_response_model.dart';

class HomeController extends GetxController {
  final PublicApi publicApi;
  HomeController({required this.publicApi});

  // ------------------------ STATE ------------------------
  final scrollController = ScrollController();

  final bannerLoading = false.obs;
  final categoryLoading = false.obs;
  final campaignLoading = false.obs;
  final popularFoodLoading = false.obs;
  final restaurantsLoading = false.obs;
  final restaurantsPaginating = false.obs;
  final configLoading = false.obs;

  final allBanners = <Banners>[].obs;
  final allCategories = <CategoriesResponseModel>[].obs;
  final config = Rx<ConfigResponseModel?>(null);
  final popularFoods = <Product>[].obs;
  final allCampaigns = <CampaignResponseModel>[].obs;
  final allRestaurants = <Restaurant>[].obs;

  final currentPageIndex = 0.obs;
  int restaurantPage = 1;
  bool hasMoreRestaurants = true;

  // ------------------------ LIFECYCLE ------------------------
  @override
  void onInit() {
    super.onInit();
    refreshAll();
    _initScrollListener();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // ------------------------ INITIAL LOAD ------------------------
  Future<void> refreshAll() async {
    await Future.wait([
      fetchConfig(),
      fetchBanners(),
      fetchCategories(),
      fetchPopularFoods(),
      fetchCampaigns(),
      fetchAllRestaurants(offset: restaurantPage),
    ]);
  }

  // ------------------------ SCROLL & PAGINATION ------------------------
  void _initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          hasMoreRestaurants) {
        fetchAllRestaurants(offset: restaurantPage);
      }
    });
  }

  // ------------------------   PAGE INDICATOR ------------------------
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  // ------------------------ DATA FETCH METHODS ------------------------

  Future<void> fetchConfig() async {
    configLoading.value = true;
    try {
      final configResponse = await publicApi.configs();
      config.value = configResponse;
    } catch (_) {
    } finally {
      configLoading.value = false;
    }
  }

  Future<void> fetchBanners() async {
    bannerLoading.value = true;
    try {
      final bannerResponse = await publicApi.allBanners();
      if (bannerResponse.banners?.isNotEmpty ?? false) {
        allBanners.assignAll(bannerResponse.banners!);
      }
    } catch (_) {
    } finally {
      bannerLoading.value = false;
    }
  }

  Future<void> fetchCategories() async {
    categoryLoading.value = true;
    try {
      final categoryResponse = await publicApi.allCategories();
      if (categoryResponse.isNotEmpty) {
        allCategories.assignAll(categoryResponse);
      }
    } catch (_) {
    } finally {
      categoryLoading.value = false;
    }
  }

  Future<void> fetchPopularFoods() async {
    popularFoodLoading.value = true;
    try {
      final popularFoodResponse = await publicApi.popularFoods();
      if (popularFoodResponse.products?.isNotEmpty ?? false) {
        popularFoods.assignAll(popularFoodResponse.products!);
      }
    } catch (_) {
    } finally {
      popularFoodLoading.value = false;
    }
  }

  Future<void> fetchCampaigns() async {
    campaignLoading.value = true;
    try {
      final campaignResponse = await publicApi.allCampaigns();
      if (campaignResponse.isNotEmpty) {
        allCampaigns.assignAll(campaignResponse);
      }
    } catch (_) {
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
    } catch (_) {
    } finally {
      restaurantsLoading.value = false;
      restaurantsPaginating.value = false;
    }
  }
}
