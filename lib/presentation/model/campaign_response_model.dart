// To parse this JSON data, do
//
//     final campaignResponseModel = campaignResponseModelFromJson(jsonString);

import 'dart:convert';

List<CampaignResponseModel> campaignResponseModelFromJson(String str) =>
    List<CampaignResponseModel>.from(
      json.decode(str).map((x) => CampaignResponseModel.fromJson(x)),
    );

String campaignResponseModelToJson(List<CampaignResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CampaignResponseModel {
  final int? id;
  final String? image;
  final String? description;
  final int? status;
  final int? adminId;
  final dynamic categoryId;
  final String? attributes;
  final String? choiceOptions;
  final int? price;
  final int? tax;
  final String? taxType;
  final int? discount;
  final String? discountType;
  final int? restaurantId;
  final int? veg;
  final dynamic slug;
  final int? maximumCartQuantity;
  final int? tempAvailable;
  final int? open;
  final String? name;
  final int? recommended;
  final dynamic tags;
  final String? restaurantName;
  final int? restaurantStatus;
  final int? restaurantDiscount;
  final String? restaurantOpeningTime;
  final String? restaurantClosingTime;
  final bool? scheduleOrder;
  final int? ratingCount;
  final int? avgRating;
  final int? minDeliveryTime;
  final int? maxDeliveryTime;
  final int? freeDelivery;
  final int? halalTagStatus;
  final dynamic nutritionsName;
  final dynamic allergiesName;
  final String? imageFullUrl;

  CampaignResponseModel({
    this.id,
    this.image,
    this.description,
    this.status,
    this.adminId,
    this.categoryId,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.restaurantId,
    this.veg,
    this.slug,
    this.maximumCartQuantity,
    this.tempAvailable,
    this.open,
    this.name,
    this.recommended,
    this.tags,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    this.scheduleOrder,
    this.ratingCount,
    this.avgRating,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.freeDelivery,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,

    this.imageFullUrl,
  });

  factory CampaignResponseModel.fromJson(Map<String, dynamic> json) =>
      CampaignResponseModel(
        id: json["id"],
        image: json["image"],
        description: json["description"],
        status: json["status"],
        adminId: json["admin_id"],
        categoryId: json["category_id"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        price: json["price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"],
        discountType: json["discount_type"],
        restaurantId: json["restaurant_id"],
        veg: json["veg"],
        slug: json["slug"],
        maximumCartQuantity: json["maximum_cart_quantity"],
        tempAvailable: json["temp_available"],
        open: json["open"],
        name: json["name"],
        recommended: json["recommended"],
        tags: json["tags"],
        restaurantName: json["restaurant_name"],
        restaurantStatus: json["restaurant_status"],
        restaurantDiscount: json["restaurant_discount"],
        restaurantOpeningTime: json["restaurant_opening_time"],
        restaurantClosingTime: json["restaurant_closing_time"],
        scheduleOrder: json["schedule_order"],
        ratingCount: json["rating_count"],
        avgRating: json["avg_rating"],
        minDeliveryTime: json["min_delivery_time"],
        maxDeliveryTime: json["max_delivery_time"],
        freeDelivery: json["free_delivery"],
        halalTagStatus: json["halal_tag_status"],
        nutritionsName: json["nutritions_name"],
        allergiesName: json["allergies_name"],
        imageFullUrl: json["image_full_url"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "status": status,
    "admin_id": adminId,
    "category_id": categoryId,
    "attributes": attributes,
    "choice_options": choiceOptions,
    "price": price,
    "tax": tax,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType,
    "restaurant_id": restaurantId,
    "veg": veg,
    "slug": slug,
    "maximum_cart_quantity": maximumCartQuantity,
    "temp_available": tempAvailable,
    "open": open,
    "name": name,
    "recommended": recommended,
    "tags": tags,
    "restaurant_name": restaurantName,
    "restaurant_status": restaurantStatus,
    "restaurant_discount": restaurantDiscount,
    "restaurant_opening_time": restaurantOpeningTime,
    "restaurant_closing_time": restaurantClosingTime,
    "schedule_order": scheduleOrder,
    "rating_count": ratingCount,
    "avg_rating": avgRating,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "free_delivery": freeDelivery,
    "halal_tag_status": halalTagStatus,
    "nutritions_name": nutritionsName,
    "allergies_name": allergiesName,
    "image_full_url": imageFullUrl,
  };
}
