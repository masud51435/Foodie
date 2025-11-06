import 'package:foodie/backend/dio_client.dart';
import 'package:foodie/backend/links.dart';
import 'package:foodie/data/models/campaign_response_model.dart';
import 'package:foodie/data/models/categories_response_model.dart';
import 'package:foodie/data/models/config_response_model.dart';
import 'package:foodie/data/models/popular_response_model.dart';
import 'package:foodie/data/models/resturants_response_model.dart';

import 'package:foodie/data/models/banner_response_model.dart';
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

  Future<List<CategoriesResponseModel>> allCategories() async {
    return await client.request(
      path: Links.categories,
      method: MethodType.get,
      parseList: (list) =>
          list.map((e) => CategoriesResponseModel.fromJson(e)).toList(),
    );
  }

  Future<PopularResponseModel> popularFoods() async {
    return await client.request(
      path: Links.popular,
      method: MethodType.get,
      parse: PopularResponseModel.fromJson,
    );
  }

  Future<List<CampaignResponseModel>> allCampaigns() async {
    return await client.request(
      path: Links.campaigns,
      method: MethodType.get,
      parseList: (list) =>
          list.map((e) => CampaignResponseModel.fromJson(e)).toList(),
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
