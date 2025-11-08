// To parse this JSON data, do
//
//     final bannerResponseModel = bannerResponseModelFromJson(jsonString);

import 'dart:convert';

BannerResponseModel bannerResponseModelFromJson(String str) =>
    BannerResponseModel.fromJson(json.decode(str));

String bannerResponseModelToJson(BannerResponseModel data) =>
    json.encode(data.toJson());

class BannerResponseModel {
  final List<dynamic>? campaigns;
  final List<Banners>? banners;

  BannerResponseModel({this.campaigns, this.banners});

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) =>
      BannerResponseModel(
        campaigns: json["campaigns"] == null
            ? []
            : List<dynamic>.from(json["campaigns"]!.map((x) => x)),
        banners: json["banners"] == null
            ? []
            : List<Banners>.from(
                json["banners"]!.map((x) => Banners.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "campaigns": campaigns == null
        ? []
        : List<dynamic>.from(campaigns!.map((x) => x)),
    "banners": banners == null
        ? []
        : List<dynamic>.from(banners!.map((x) => x.toJson())),
  };
}

class Banners {
  final int? id;
  final String? title;
  final String? type;
  final String? image;
  final dynamic food;
  final String? imageFullUrl;

  Banners({
    this.id,
    this.title,
    this.type,
    this.image,
    this.food,
    this.imageFullUrl,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    image: json["image"],
    food: json["food"],
    imageFullUrl: json["image_full_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
    "image": image,
    "food": food,
    "image_full_url": imageFullUrl,
  };
}
