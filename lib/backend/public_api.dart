import 'package:foodie/backend/dio_client.dart';
import 'package:foodie/backend/links.dart';
import 'package:foodie/presentation/model/campaign_response_model.dart';
import 'package:foodie/presentation/model/categories_response_model.dart';
import 'package:foodie/presentation/model/config_response_model.dart';
import 'package:foodie/presentation/model/popular_response_model.dart';
import 'package:foodie/presentation/model/resturants_response_model.dart';

import '../presentation/model/banner_response_model.dart';
import 'method_types.dart';

class PublicApi {
  final DioClient client;

  PublicApi({required this.client});

  Future<ConfigResponseModel> configs() async {
    return await client.request(
      path: Links.config,
      method: MethodType.get,
      parse: ConfigResponseModel.fromJson,
    );
  }

  Future<BannerResponseModel> allBanners() async {
    return await client.request(
      path: Links.banners,
      method: MethodType.get,
      parse: BannerResponseModel.fromJson,
    );
  }

  Future<CategoriesResponseModel> allCategories() async {
    return await client.request(
      path: Links.categories,
      method: MethodType.get,
      parse: CategoriesResponseModel.fromJson,
    );
  }

  Future<PopularResponseModel> popularFoods() async {
    return await client.request(
      path: Links.popular,
      method: MethodType.get,
      parse: PopularResponseModel.fromJson,
    );
  }

  Future<CampaignResponseModel> allCampaigns() async {
    return await client.request(
      path: Links.campaigns,
      method: MethodType.get,
      parse: CampaignResponseModel.fromJson,
    );
  }

  Future<RestaurantsResponseModel> allRestaurants({
    required int offset,
    required int limit,
  }) {
    return client.request(
      path: Links.restaurants,
      method: MethodType.get,
      parse: RestaurantsResponseModel.fromJson,
      queryParams: {'offset': offset.toString(), 'limit': limit.toString()},
    );
  }
}
