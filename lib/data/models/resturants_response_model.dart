// To parse this JSON data, do
//
//     final restaurantsResponseModel = restaurantsResponseModelFromJson(jsonString);

import 'dart:convert';

RestaurantsResponseModel restaurantsResponseModelFromJson(String str) =>
    RestaurantsResponseModel.fromJson(json.decode(str));

String restaurantsResponseModelToJson(RestaurantsResponseModel data) =>
    json.encode(data.toJson());

class RestaurantsResponseModel {
  final String? filterData;
  final int? totalSize;
  final String? limit;
  final String? offset;
  final List<Restaurant>? restaurants;

  RestaurantsResponseModel({
    this.filterData,
    this.totalSize,
    this.limit,
    this.offset,
    this.restaurants,
  });

  factory RestaurantsResponseModel.fromJson(Map<String, dynamic> json) =>
      RestaurantsResponseModel(
        filterData: json["filter_data"],
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurants"]!.map((x) => Restaurant.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "filter_data": filterData,
    "total_size": totalSize,
    "limit": limit,
    "offset": offset,
    "restaurants": restaurants == null
        ? []
        : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? logo;
  final String? latitude;
  final String? longitude;
  final String? address;
  final dynamic footerText;
  final int? minimumOrder;
  final int? comission;
  final bool? scheduleOrder;
  final dynamic openingTime;
  final dynamic closeingTime;
  final int? status;
  final int? vendorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? freeDelivery;
  final String? coverPhoto;
  final bool? delivery;
  final bool? takeAway;
  final bool? foodSection;
  final double? tax;
  final int? zoneId;
  final bool? reviewsSection;
  final bool? active;
  final int? selfDeliverySystem;
  final bool? posSystem;
  final int? minimumShippingCharge;
  final int? veg;
  final int? nonVeg;
  final int? orderCount;
  final int? totalOrder;
  final int? perKmShippingCharge;
  final dynamic maximumShippingCharge;
  final String? slug;
  final bool? orderSubscriptionActive;
  final bool? cutlery;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final int? announcement;
  final String? announcementMessage;
  final dynamic qrCode;
  final dynamic additionalData;
  final dynamic packageId;
  final String? tin;
  final DateTime? tinExpireDate;
  final String? tinCertificateImage;
  final int? open;
  final double? distance;
  final int? foodsCount;
  final int? reviewsCommentsCount;
  final int? priceStartsFrom;
  final int? restaurantStatus;
  final double? avgRating;
  final int? ratingCount;
  final int? positiveRating;
  final int? customerOrderDate;
  final bool? customerDateOrderSratus;
  final bool? instantOrder;
  final bool? halalTagStatus;
  final String? currentOpeningTime;
  final bool? isExtraPackagingActive;
  final bool? extraPackagingStatus;
  final int? extraPackagingAmount;
  final bool? isDineInActive;
  final bool? canEditOrder;
  final bool? gstStatus;
  final String? gstCode;
  final bool? freeDeliveryDistanceStatus;
  final String? freeDeliveryDistanceValue;
  final String? logoFullUrl;
  final String? coverPhotoFullUrl;
  final String? metaImageFullUrl;
  final String? tinCertificateImageFullUrl;
  final dynamic discount;

  Restaurant({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.logo,
    this.latitude,
    this.longitude,
    this.address,
    this.footerText,
    this.minimumOrder,
    this.comission,
    this.scheduleOrder,
    this.openingTime,
    this.closeingTime,
    this.status,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.freeDelivery,
    this.coverPhoto,
    this.delivery,
    this.takeAway,
    this.foodSection,
    this.tax,
    this.zoneId,
    this.reviewsSection,
    this.active,
    this.selfDeliverySystem,
    this.posSystem,
    this.minimumShippingCharge,
    this.veg,
    this.nonVeg,
    this.orderCount,
    this.totalOrder,
    this.perKmShippingCharge,
    this.maximumShippingCharge,
    this.slug,
    this.orderSubscriptionActive,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.announcement,
    this.announcementMessage,
    this.qrCode,
    this.additionalData,
    this.packageId,
    this.tin,
    this.tinExpireDate,
    this.tinCertificateImage,
    this.open,
    this.distance,
    this.foodsCount,
    this.reviewsCommentsCount,
    this.priceStartsFrom,
    this.restaurantStatus,
    this.avgRating,
    this.ratingCount,
    this.positiveRating,
    this.customerOrderDate,
    this.customerDateOrderSratus,
    this.instantOrder,
    this.halalTagStatus,
    this.currentOpeningTime,
    this.isExtraPackagingActive,
    this.extraPackagingStatus,
    this.extraPackagingAmount,
    this.isDineInActive,
    this.canEditOrder,
    this.gstStatus,
    this.gstCode,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.logoFullUrl,
    this.discount,
    this.coverPhotoFullUrl,
    this.metaImageFullUrl,
    this.tinCertificateImageFullUrl,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    logo: json["logo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
    footerText: json["footer_text"],
    minimumOrder: json["minimum_order"],
    comission: json["comission"],
    scheduleOrder: json["schedule_order"],
    openingTime: json["opening_time"],
    closeingTime: json["closeing_time"],
    status: json["status"],
    vendorId: json["vendor_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    freeDelivery: json["free_delivery"],
    coverPhoto: json["cover_photo"],
    delivery: json["delivery"],
    takeAway: json["take_away"],
    foodSection: json["food_section"],
    tax: json["tax"]?.toDouble(),
    zoneId: json["zone_id"],
    reviewsSection: json["reviews_section"],
    active: json["active"],
    selfDeliverySystem: json["self_delivery_system"],
    posSystem: json["pos_system"],
    minimumShippingCharge: json["minimum_shipping_charge"],
    veg: json["veg"],
    nonVeg: json["non_veg"],
    orderCount: json["order_count"],
    totalOrder: json["total_order"],
    perKmShippingCharge: json["per_km_shipping_charge"],
    maximumShippingCharge: json["maximum_shipping_charge"],
    slug: json["slug"],
    orderSubscriptionActive: json["order_subscription_active"],
    cutlery: json["cutlery"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImage: json["meta_image"],
    announcement: json["announcement"],
    announcementMessage: json["announcement_message"],
    qrCode: json["qr_code"],
    additionalData: json["additional_data"],
    packageId: json["package_id"],
    tin: json["tin"],
    tinExpireDate: json["tin_expire_date"] == null
        ? null
        : DateTime.parse(json["tin_expire_date"]),
    tinCertificateImage: json["tin_certificate_image"],
    open: json["open"],
    distance: json["distance"]?.toDouble(),
    foodsCount: json["foods_count"],
    reviewsCommentsCount: json["reviews_comments_count"],
    restaurantStatus: json["restaurant_status"],
    avgRating: json["avg_rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    positiveRating: json["positive_rating"],
    customerOrderDate: json["customer_order_date"],
    customerDateOrderSratus: json["customer_date_order_sratus"],
    instantOrder: json["instant_order"],
    halalTagStatus: json["halal_tag_status"],
    currentOpeningTime: json["current_opening_time"],
    isExtraPackagingActive: json["is_extra_packaging_active"],
    extraPackagingStatus: json["extra_packaging_status"],
    extraPackagingAmount: json["extra_packaging_amount"],
    isDineInActive: json["is_dine_in_active"],
    canEditOrder: json["can_edit_order"],
    gstStatus: json["gst_status"],
    gstCode: json["gst_code"],
    freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
    freeDeliveryDistanceValue: json["free_delivery_distance_value"],
    logoFullUrl: json["logo_full_url"],
    coverPhotoFullUrl: json["cover_photo_full_url"],
    metaImageFullUrl: json["meta_image_full_url"],
    tinCertificateImageFullUrl: json["tin_certificate_image_full_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "logo": logo,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "footer_text": footerText,
    "minimum_order": minimumOrder,
    "comission": comission,
    "schedule_order": scheduleOrder,
    "opening_time": openingTime,
    "closeing_time": closeingTime,
    "status": status,
    "vendor_id": vendorId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "free_delivery": freeDelivery,
    "cover_photo": coverPhoto,
    "delivery": delivery,
    "take_away": takeAway,
    "food_section": foodSection,
    "tax": tax,
    "zone_id": zoneId,
    "reviews_section": reviewsSection,
    "active": active,

    "self_delivery_system": selfDeliverySystem,
    "pos_system": posSystem,
    "minimum_shipping_charge": minimumShippingCharge,

    "veg": veg,
    "non_veg": nonVeg,
    "order_count": orderCount,
    "total_order": totalOrder,
    "per_km_shipping_charge": perKmShippingCharge,

    "maximum_shipping_charge": maximumShippingCharge,
    "slug": slug,
    "order_subscription_active": orderSubscriptionActive,
    "cutlery": cutlery,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_image": metaImage,
    "announcement": announcement,
    "announcement_message": announcementMessage,
    "qr_code": qrCode,
    "additional_data": additionalData,
    "package_id": packageId,
    "tin": tin,
    "tin_expire_date":
        "${tinExpireDate!.year.toString().padLeft(4, '0')}-${tinExpireDate!.month.toString().padLeft(2, '0')}-${tinExpireDate!.day.toString().padLeft(2, '0')}",
    "tin_certificate_image": tinCertificateImage,
    "open": open,
    "distance": distance,
    "foods_count": foodsCount,
    "reviews_comments_count": reviewsCommentsCount,
    "price_starts_from": priceStartsFrom,
    "restaurant_status": restaurantStatus,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "positive_rating": positiveRating,
    "customer_order_date": customerOrderDate,
    "customer_date_order_sratus": customerDateOrderSratus,
    "instant_order": instantOrder,
    "halal_tag_status": halalTagStatus,
    "current_opening_time": currentOpeningTime,
    "is_extra_packaging_active": isExtraPackagingActive,
    "extra_packaging_status": extraPackagingStatus,
    "extra_packaging_amount": extraPackagingAmount,
    "is_dine_in_active": isDineInActive,
    "can_edit_order": canEditOrder,
    "gst_status": gstStatus,
    "gst_code": gstCode,
    "free_delivery_distance_status": freeDeliveryDistanceStatus,
    "free_delivery_distance_value": freeDeliveryDistanceValue,
    "logo_full_url": logoFullUrl,
    "cover_photo_full_url": coverPhotoFullUrl,
    "meta_image_full_url": metaImageFullUrl,
    "tin_certificate_image_full_url": tinCertificateImageFullUrl,
    "discount": discount,
  };
}
