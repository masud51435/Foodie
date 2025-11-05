// To parse this JSON data, do
//
//     final bannerResponseModel = bannerResponseModelFromJson(jsonString);

import 'dart:convert';

BannerResponseModel bannerResponseModelFromJson(String str) => BannerResponseModel.fromJson(json.decode(str));

String bannerResponseModelToJson(BannerResponseModel data) => json.encode(data.toJson());

class BannerResponseModel {
    final List<dynamic>? campaigns;
    final List<Banner>? banners;

    BannerResponseModel({
        this.campaigns,
        this.banners,
    });

    factory BannerResponseModel.fromJson(Map<String, dynamic> json) => BannerResponseModel(
        campaigns: json["campaigns"] == null ? [] : List<dynamic>.from(json["campaigns"]!.map((x) => x)),
        banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "campaigns": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x)),
        "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
    };
}

class Banner {
    final int? id;
    final String? title;
    final String? type;
    final String? image;
    final Restaurant? restaurant;
    final dynamic food;
    final String? imageFullUrl;

    Banner({
        this.id,
        this.title,
        this.type,
        this.image,
        this.restaurant,
        this.food,
        this.imageFullUrl,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        image: json["image"],
        restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
        food: json["food"],
        imageFullUrl: json["image_full_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "image": image,
        "restaurant": restaurant?.toJson(),
        "food": food,
        "image_full_url": imageFullUrl,
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
    final String? offDay;
    final int? selfDeliverySystem;
    final bool? posSystem;
    final int? minimumShippingCharge;
    final String? deliveryTime;
    final int? veg;
    final int? nonVeg;
    final int? orderCount;
    final int? totalOrder;
    final int? perKmShippingCharge;
    final String? restaurantModel;
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
    final String? additionalDocuments;
    final dynamic packageId;
    final String? tin;
    final DateTime? tinExpireDate;
    final String? tinCertificateImage;
    final int? restaurantStatus;
    final List<Food>? foods;
    final List<Coupon>? coupons;
    final List<Cuisine>? cuisine;
    final List<int>? ratings;
    final double? avgRating;
    final int? ratingCount;
    final int? positiveRating;
    final int? priceStartsFrom;
    final int? customerOrderDate;
    final bool? customerDateOrderSratus;
    final bool? instantOrder;
    final bool? halalTagStatus;
    final bool? isExtraPackagingActive;
    final bool? extraPackagingStatus;
    final int? extraPackagingAmount;
    final String? deliveryFee;
    final String? currentOpeningTime;
    final bool? isDineInActive;
    final int? scheduleAdvanceDineInBookingDuration;
    final String? scheduleAdvanceDineInBookingDurationTimeFormat;
    final List<dynamic>? tags;
    final bool? canEditOrder;
    final List<String>? characteristics;
    final bool? gstStatus;
    final String? gstCode;
    final bool? freeDeliveryDistanceStatus;
    final String? freeDeliveryDistanceValue;
    final String? logoFullUrl;
    final String? coverPhotoFullUrl;
    final String? metaImageFullUrl;
    final String? tinCertificateImageFullUrl;
    final List<Translation>? translations;
    final List<Storage>? storage;
    final List<Schedule>? schedules;

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
        this.offDay,
        this.selfDeliverySystem,
        this.posSystem,
        this.minimumShippingCharge,
        this.deliveryTime,
        this.veg,
        this.nonVeg,
        this.orderCount,
        this.totalOrder,
        this.perKmShippingCharge,
        this.restaurantModel,
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
        this.additionalDocuments,
        this.packageId,
        this.tin,
        this.tinExpireDate,
        this.tinCertificateImage,
        this.restaurantStatus,
        this.foods,
        this.coupons,
        this.cuisine,
        this.ratings,
        this.avgRating,
        this.ratingCount,
        this.positiveRating,
        this.priceStartsFrom,
        this.customerOrderDate,
        this.customerDateOrderSratus,
        this.instantOrder,
        this.halalTagStatus,
        this.isExtraPackagingActive,
        this.extraPackagingStatus,
        this.extraPackagingAmount,
        this.deliveryFee,
        this.currentOpeningTime,
        this.isDineInActive,
        this.scheduleAdvanceDineInBookingDuration,
        this.scheduleAdvanceDineInBookingDurationTimeFormat,
        this.tags,
        this.canEditOrder,
        this.characteristics,
        this.gstStatus,
        this.gstCode,
        this.freeDeliveryDistanceStatus,
        this.freeDeliveryDistanceValue,
        this.logoFullUrl,
        this.coverPhotoFullUrl,
        this.metaImageFullUrl,
        this.tinCertificateImageFullUrl,
        this.translations,
        this.storage,
        this.schedules,
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        freeDelivery: json["free_delivery"],
        coverPhoto: json["cover_photo"],
        delivery: json["delivery"],
        takeAway: json["take_away"],
        foodSection: json["food_section"],
        tax: json["tax"]?.toDouble(),
        zoneId: json["zone_id"],
        reviewsSection: json["reviews_section"],
        active: json["active"],
        offDay: json["off_day"],
        selfDeliverySystem: json["self_delivery_system"],
        posSystem: json["pos_system"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        deliveryTime: json["delivery_time"],
        veg: json["veg"],
        nonVeg: json["non_veg"],
        orderCount: json["order_count"],
        totalOrder: json["total_order"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        restaurantModel: json["restaurant_model"],
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
        additionalDocuments: json["additional_documents"],
        packageId: json["package_id"],
        tin: json["tin"],
        tinExpireDate: json["tin_expire_date"] == null ? null : DateTime.parse(json["tin_expire_date"]),
        tinCertificateImage: json["tin_certificate_image"],
        restaurantStatus: json["restaurant_status"],
        foods: json["foods"] == null ? [] : List<Food>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        coupons: json["coupons"] == null ? [] : List<Coupon>.from(json["coupons"]!.map((x) => Coupon.fromJson(x))),
        cuisine: json["cuisine"] == null ? [] : List<Cuisine>.from(json["cuisine"]!.map((x) => Cuisine.fromJson(x))),
        ratings: json["ratings"] == null ? [] : List<int>.from(json["ratings"]!.map((x) => x)),
        avgRating: json["avg_rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        positiveRating: json["positive_rating"],
        priceStartsFrom: json["price_starts_from"],
        customerOrderDate: json["customer_order_date"],
        customerDateOrderSratus: json["customer_date_order_sratus"],
        instantOrder: json["instant_order"],
        halalTagStatus: json["halal_tag_status"],
        isExtraPackagingActive: json["is_extra_packaging_active"],
        extraPackagingStatus: json["extra_packaging_status"],
        extraPackagingAmount: json["extra_packaging_amount"],
        deliveryFee: json["delivery_fee"],
        currentOpeningTime: json["current_opening_time"],
        isDineInActive: json["is_dine_in_active"],
        scheduleAdvanceDineInBookingDuration: json["schedule_advance_dine_in_booking_duration"],
        scheduleAdvanceDineInBookingDurationTimeFormat: json["schedule_advance_dine_in_booking_duration_time_format"],
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
        canEditOrder: json["can_edit_order"],
        characteristics: json["characteristics"] == null ? [] : List<String>.from(json["characteristics"]!.map((x) => x)),
        gstStatus: json["gst_status"],
        gstCode: json["gst_code"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        logoFullUrl: json["logo_full_url"],
        coverPhotoFullUrl: json["cover_photo_full_url"],
        metaImageFullUrl: json["meta_image_full_url"],
        tinCertificateImageFullUrl: json["tin_certificate_image_full_url"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
        storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
        schedules: json["schedules"] == null ? [] : List<Schedule>.from(json["schedules"]!.map((x) => Schedule.fromJson(x))),
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
        "off_day": offDay,
        "self_delivery_system": selfDeliverySystem,
        "pos_system": posSystem,
        "minimum_shipping_charge": minimumShippingCharge,
        "delivery_time": deliveryTime,
        "veg": veg,
        "non_veg": nonVeg,
        "order_count": orderCount,
        "total_order": totalOrder,
        "per_km_shipping_charge": perKmShippingCharge,
        "restaurant_model": restaurantModel,
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
        "additional_documents": additionalDocuments,
        "package_id": packageId,
        "tin": tin,
        "tin_expire_date": "${tinExpireDate!.year.toString().padLeft(4, '0')}-${tinExpireDate!.month.toString().padLeft(2, '0')}-${tinExpireDate!.day.toString().padLeft(2, '0')}",
        "tin_certificate_image": tinCertificateImage,
        "restaurant_status": restaurantStatus,
        "foods": foods == null ? [] : List<dynamic>.from(foods!.map((x) => x.toJson())),
        "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x.toJson())),
        "cuisine": cuisine == null ? [] : List<dynamic>.from(cuisine!.map((x) => x.toJson())),
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "avg_rating": avgRating,
        "rating_count": ratingCount,
        "positive_rating": positiveRating,
        "price_starts_from": priceStartsFrom,
        "customer_order_date": customerOrderDate,
        "customer_date_order_sratus": customerDateOrderSratus,
        "instant_order": instantOrder,
        "halal_tag_status": halalTagStatus,
        "is_extra_packaging_active": isExtraPackagingActive,
        "extra_packaging_status": extraPackagingStatus,
        "extra_packaging_amount": extraPackagingAmount,
        "delivery_fee": deliveryFee,
        "current_opening_time": currentOpeningTime,
        "is_dine_in_active": isDineInActive,
        "schedule_advance_dine_in_booking_duration": scheduleAdvanceDineInBookingDuration,
        "schedule_advance_dine_in_booking_duration_time_format": scheduleAdvanceDineInBookingDurationTimeFormat,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "can_edit_order": canEditOrder,
        "characteristics": characteristics == null ? [] : List<dynamic>.from(characteristics!.map((x) => x)),
        "gst_status": gstStatus,
        "gst_code": gstCode,
        "free_delivery_distance_status": freeDeliveryDistanceStatus,
        "free_delivery_distance_value": freeDeliveryDistanceValue,
        "logo_full_url": logoFullUrl,
        "cover_photo_full_url": coverPhotoFullUrl,
        "meta_image_full_url": metaImageFullUrl,
        "tin_certificate_image_full_url": tinCertificateImageFullUrl,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
        "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
    };
}

class Coupon {
    final int? id;
    final String? title;
    final String? code;
    final DateTime? startDate;
    final DateTime? expireDate;
    final int? minPurchase;
    final int? maxDiscount;
    final int? discount;
    final String? discountType;
    final String? couponType;
    final int? limit;
    final int? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? data;
    final int? totalUses;
    final String? createdBy;
    final String? customerId;
    final dynamic slug;
    final int? restaurantId;
    final List<Translation>? translations;

    Coupon({
        this.id,
        this.title,
        this.code,
        this.startDate,
        this.expireDate,
        this.minPurchase,
        this.maxDiscount,
        this.discount,
        this.discountType,
        this.couponType,
        this.limit,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.data,
        this.totalUses,
        this.createdBy,
        this.customerId,
        this.slug,
        this.restaurantId,
        this.translations,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
        minPurchase: json["min_purchase"],
        maxDiscount: json["max_discount"],
        discount: json["discount"],
        discountType: json["discount_type"],
        couponType: json["coupon_type"],
        limit: json["limit"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        data: json["data"],
        totalUses: json["total_uses"],
        createdBy: json["created_by"],
        customerId: json["customer_id"],
        slug: json["slug"],
        restaurantId: json["restaurant_id"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "expire_date": "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "min_purchase": minPurchase,
        "max_discount": maxDiscount,
        "discount": discount,
        "discount_type": discountType,
        "coupon_type": couponType,
        "limit": limit,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "data": data,
        "total_uses": totalUses,
        "created_by": createdBy,
        "customer_id": customerId,
        "slug": slug,
        "restaurant_id": restaurantId,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    };
}

class Translation {
    final int? id;
    final Type? translationableType;
    final int? translationableId;
    final Locale? locale;
    final TranslationKey? key;
    final String? value;
    final dynamic createdAt;
    final dynamic updatedAt;

    Translation({
        this.id,
        this.translationableType,
        this.translationableId,
        this.locale,
        this.key,
        this.value,
        this.createdAt,
        this.updatedAt,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        translationableType: typeValues.map[json["translationable_type"]]!,
        translationableId: json["translationable_id"],
        locale: localeValues.map[json["locale"]]!,
        key: translationKeyValues.map[json["key"]]!,
        value: json["value"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "translationable_type": typeValues.reverse[translationableType],
        "translationable_id": translationableId,
        "locale": localeValues.reverse[locale],
        "key": translationKeyValues.reverse[key],
        "value": value,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

enum TranslationKey {
    ADDRESS,
    CUISINE_NAME,
    DESCRIPTION,
    META_DESCRIPTION,
    META_TITLE,
    NAME,
    TITLE
}

final translationKeyValues = EnumValues({
    "address": TranslationKey.ADDRESS,
    "cuisine_name": TranslationKey.CUISINE_NAME,
    "description": TranslationKey.DESCRIPTION,
    "meta_description": TranslationKey.META_DESCRIPTION,
    "meta_title": TranslationKey.META_TITLE,
    "name": TranslationKey.NAME,
    "title": TranslationKey.TITLE
});

enum Locale {
    EN
}

final localeValues = EnumValues({
    "en": Locale.EN
});

enum Type {
    APP_MODELS_COUPON,
    APP_MODELS_CUISINE,
    APP_MODELS_FOOD,
    APP_MODELS_RESTAURANT
}

final typeValues = EnumValues({
    "App\\Models\\Coupon": Type.APP_MODELS_COUPON,
    "App\\Models\\Cuisine": Type.APP_MODELS_CUISINE,
    "App\\Models\\Food": Type.APP_MODELS_FOOD,
    "App\\Models\\Restaurant": Type.APP_MODELS_RESTAURANT
});

class Cuisine {
    final int? id;
    final String? name;
    final String? image;
    final int? status;
    final String? slug;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? imageFullUrl;
    final Pivot? pivot;
    final List<Translation>? translations;
    final List<Storage>? storage;

    Cuisine({
        this.id,
        this.name,
        this.image,
        this.status,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.imageFullUrl,
        this.pivot,
        this.translations,
        this.storage,
    });

    factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        imageFullUrl: json["image_full_url"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
        storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_full_url": imageFullUrl,
        "pivot": pivot?.toJson(),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
    };
}

class Pivot {
    final int? restaurantId;
    final int? cuisineId;

    Pivot({
        this.restaurantId,
        this.cuisineId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        restaurantId: json["restaurant_id"],
        cuisineId: json["cuisine_id"],
    );

    Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "cuisine_id": cuisineId,
    };
}

class Storage {
    final int? id;
    final Type? dataType;
    final String? dataId;
    final StorageKey? key;
    final Value? value;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Storage({
        this.id,
        this.dataType,
        this.dataId,
        this.key,
        this.value,
        this.createdAt,
        this.updatedAt,
    });

    factory Storage.fromJson(Map<String, dynamic> json) => Storage(
        id: json["id"],
        dataType: typeValues.map[json["data_type"]]!,
        dataId: json["data_id"],
        key: storageKeyValues.map[json["key"]]!,
        value: valueValues.map[json["value"]]!,
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "data_type": typeValues.reverse[dataType],
        "data_id": dataId,
        "key": storageKeyValues.reverse[key],
        "value": valueValues.reverse[value],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum StorageKey {
    COVER_PHOTO,
    IMAGE,
    LOGO
}

final storageKeyValues = EnumValues({
    "cover_photo": StorageKey.COVER_PHOTO,
    "image": StorageKey.IMAGE,
    "logo": StorageKey.LOGO
});

enum Value {
    PUBLIC
}

final valueValues = EnumValues({
    "public": Value.PUBLIC
});

class Food {
    final int? id;
    final String? image;
    final String? name;
    final String? imageFullUrl;
    final List<Storage>? storage;
    final List<Translation>? translations;

    Food({
        this.id,
        this.image,
        this.name,
        this.imageFullUrl,
        this.storage,
        this.translations,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        imageFullUrl: json["image_full_url"],
        storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "image_full_url": imageFullUrl,
        "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    };
}

class Schedule {
    final int? id;
    final int? restaurantId;
    final int? day;
    final String? openingTime;
    final String? closingTime;
    final dynamic createdAt;
    final dynamic updatedAt;

    Schedule({
        this.id,
        this.restaurantId,
        this.day,
        this.openingTime,
        this.closingTime,
        this.createdAt,
        this.updatedAt,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        day: json["day"],
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "day": day,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
