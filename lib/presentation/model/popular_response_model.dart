// To parse this JSON data, do
//
//     final popularResponseModel = popularResponseModelFromJson(jsonString);

import 'dart:convert';

PopularResponseModel popularResponseModelFromJson(String str) =>
    PopularResponseModel.fromJson(json.decode(str));

String popularResponseModelToJson(PopularResponseModel data) =>
    json.encode(data.toJson());

class PopularResponseModel {
  final int? totalSize;
  final dynamic limit;
  final dynamic offset;
  final List<Product>? products;

  PopularResponseModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  factory PopularResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularResponseModel(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "limit": limit,
    "offset": offset,
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final int? categoryId;
  final List<CategoryId>? categoryIds;
  final List<Variation>? variations;
  final List<AddOn>? addOns;
  final Attributes? attributes;
  final Attributes? choiceOptions;
  final int? price;
  final int? tax;
  final DiscountTypeEnum? taxType;
  final int? discount;
  final DiscountTypeEnum? discountType;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  final int? veg;
  final int? status;
  final int? restaurantId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? orderCount;
  final double? avgRating;
  final int? ratingCount;
  final int? recommended;
  final String? slug;
  final dynamic maximumCartQuantity;
  final int? isHalal;
  final int? itemStock;
  final int? sellCount;
  final StockType? stockType;
  final int? tempAvailable;
  final int? open;
  final int? reviewsCount;
  final List<Tag>? tags;
  final String? restaurantName;
  final int? restaurantStatus;
  final int? restaurantDiscount;
  final RestaurantOpeningTime? restaurantOpeningTime;
  final RestaurantClosingTime? restaurantClosingTime;
  final bool? scheduleOrder;
  final int? minDeliveryTime;
  final int? maxDeliveryTime;
  final int? freeDelivery;
  final int? halalTagStatus;
  final List<String>? nutritionsName;
  final List<String>? allergiesName;
  final List<Cuisine>? cuisines;
  final List<dynamic>? taxData;
  final String? imageFullUrl;
  final List<Storage>? storage;
  final List<Translation>? translations;
  final List<Nutrition>? nutritions;
  final List<Allergy>? allergies;
  final List<dynamic>? newVariations;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.recommended,
    this.slug,
    this.maximumCartQuantity,
    this.isHalal,
    this.itemStock,
    this.sellCount,
    this.stockType,
    this.tempAvailable,
    this.open,
    this.reviewsCount,
    this.tags,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    this.scheduleOrder,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.freeDelivery,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    this.cuisines,
    this.taxData,
    this.imageFullUrl,
    this.storage,
    this.translations,
    this.nutritions,
    this.allergies,
    this.newVariations,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryId: json["category_id"],
    categoryIds: json["category_ids"] == null
        ? []
        : List<CategoryId>.from(
            json["category_ids"]!.map((x) => CategoryId.fromJson(x)),
          ),
    variations: json["variations"] == null
        ? []
        : List<Variation>.from(
            json["variations"]!.map((x) => Variation.fromJson(x)),
          ),
    addOns: json["add_ons"] == null
        ? []
        : List<AddOn>.from(json["add_ons"]!.map((x) => AddOn.fromJson(x))),
    attributes: attributesValues.map[json["attributes"]]!,
    choiceOptions: attributesValues.map[json["choice_options"]]!,
    price: json["price"],
    tax: json["tax"],
    taxType: discountTypeEnumValues.map[json["tax_type"]]!,
    discount: json["discount"],
    discountType: discountTypeEnumValues.map[json["discount_type"]]!,
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    veg: json["veg"],
    status: json["status"],
    restaurantId: json["restaurant_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    orderCount: json["order_count"],
    avgRating: json["avg_rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    recommended: json["recommended"],
    slug: json["slug"],
    maximumCartQuantity: json["maximum_cart_quantity"],
    isHalal: json["is_halal"],
    itemStock: json["item_stock"],
    sellCount: json["sell_count"],
    stockType: stockTypeValues.map[json["stock_type"]]!,
    tempAvailable: json["temp_available"],
    open: json["open"],
    reviewsCount: json["reviews_count"],
    tags: json["tags"] == null
        ? []
        : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    restaurantName: json["restaurant_name"],
    restaurantStatus: json["restaurant_status"],
    restaurantDiscount: json["restaurant_discount"],
    restaurantOpeningTime:
        restaurantOpeningTimeValues.map[json["restaurant_opening_time"]]!,
    restaurantClosingTime:
        restaurantClosingTimeValues.map[json["restaurant_closing_time"]]!,
    scheduleOrder: json["schedule_order"],
    minDeliveryTime: json["min_delivery_time"],
    maxDeliveryTime: json["max_delivery_time"],
    freeDelivery: json["free_delivery"],
    halalTagStatus: json["halal_tag_status"],
    nutritionsName: json["nutritions_name"] == null
        ? []
        : List<String>.from(json["nutritions_name"]!.map((x) => x)),
    allergiesName: json["allergies_name"] == null
        ? []
        : List<String>.from(json["allergies_name"]!.map((x) => x)),
    cuisines: json["cuisines"] == null
        ? []
        : List<Cuisine>.from(json["cuisines"]!.map((x) => Cuisine.fromJson(x))),
    taxData: json["tax_data"] == null
        ? []
        : List<dynamic>.from(json["tax_data"]!.map((x) => x)),
    imageFullUrl: json["image_full_url"],
    storage: json["storage"] == null
        ? []
        : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
    translations: json["translations"] == null
        ? []
        : List<Translation>.from(
            json["translations"]!.map((x) => Translation.fromJson(x)),
          ),
    nutritions: json["nutritions"] == null
        ? []
        : List<Nutrition>.from(
            json["nutritions"]!.map((x) => Nutrition.fromJson(x)),
          ),
    allergies: json["allergies"] == null
        ? []
        : List<Allergy>.from(
            json["allergies"]!.map((x) => Allergy.fromJson(x)),
          ),
    newVariations: json["new_variations"] == null
        ? []
        : List<dynamic>.from(json["new_variations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "category_ids": categoryIds == null
        ? []
        : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
    "variations": variations == null
        ? []
        : List<dynamic>.from(variations!.map((x) => x.toJson())),
    "add_ons": addOns == null
        ? []
        : List<dynamic>.from(addOns!.map((x) => x.toJson())),
    "attributes": attributesValues.reverse[attributes],
    "choice_options": attributesValues.reverse[choiceOptions],
    "price": price,
    "tax": tax,
    "tax_type": discountTypeEnumValues.reverse[taxType],
    "discount": discount,
    "discount_type": discountTypeEnumValues.reverse[discountType],
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "veg": veg,
    "status": status,
    "restaurant_id": restaurantId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_count": orderCount,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "recommended": recommended,
    "slug": slug,
    "maximum_cart_quantity": maximumCartQuantity,
    "is_halal": isHalal,
    "item_stock": itemStock,
    "sell_count": sellCount,
    "stock_type": stockTypeValues.reverse[stockType],
    "temp_available": tempAvailable,
    "open": open,
    "reviews_count": reviewsCount,
    "tags": tags == null
        ? []
        : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "restaurant_name": restaurantName,
    "restaurant_status": restaurantStatus,
    "restaurant_discount": restaurantDiscount,
    "restaurant_opening_time":
        restaurantOpeningTimeValues.reverse[restaurantOpeningTime],
    "restaurant_closing_time":
        restaurantClosingTimeValues.reverse[restaurantClosingTime],
    "schedule_order": scheduleOrder,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "free_delivery": freeDelivery,
    "halal_tag_status": halalTagStatus,
    "nutritions_name": nutritionsName == null
        ? []
        : List<dynamic>.from(nutritionsName!.map((x) => x)),
    "allergies_name": allergiesName == null
        ? []
        : List<dynamic>.from(allergiesName!.map((x) => x)),
    "cuisines": cuisines == null
        ? []
        : List<dynamic>.from(cuisines!.map((x) => x.toJson())),
    "tax_data": taxData == null
        ? []
        : List<dynamic>.from(taxData!.map((x) => x)),
    "image_full_url": imageFullUrl,
    "storage": storage == null
        ? []
        : List<dynamic>.from(storage!.map((x) => x.toJson())),
    "translations": translations == null
        ? []
        : List<dynamic>.from(translations!.map((x) => x.toJson())),
    "nutritions": nutritions == null
        ? []
        : List<dynamic>.from(nutritions!.map((x) => x.toJson())),
    "allergies": allergies == null
        ? []
        : List<dynamic>.from(allergies!.map((x) => x.toJson())),
    "new_variations": newVariations == null
        ? []
        : List<dynamic>.from(newVariations!.map((x) => x)),
  };
}

class AddOn {
  final int? id;
  final String? name;
  final int? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? restaurantId;
  final int? status;
  final StockType? stockType;
  final int? addonStock;
  final int? sellCount;
  final int? addonCategoryId;
  final List<dynamic>? taxIds;
  final List<Translation>? translations;

  AddOn({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.restaurantId,
    this.status,
    this.stockType,
    this.addonStock,
    this.sellCount,
    this.addonCategoryId,
    this.taxIds,
    this.translations,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    restaurantId: json["restaurant_id"],
    status: json["status"],
    stockType: stockTypeValues.map[json["stock_type"]]!,
    addonStock: json["addon_stock"],
    sellCount: json["sell_count"],
    addonCategoryId: json["addon_category_id"],
    taxIds: json["tax_ids"] == null
        ? []
        : List<dynamic>.from(json["tax_ids"]!.map((x) => x)),
    translations: json["translations"] == null
        ? []
        : List<Translation>.from(
            json["translations"]!.map((x) => Translation.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "restaurant_id": restaurantId,
    "status": status,
    "stock_type": stockTypeValues.reverse[stockType],
    "addon_stock": addonStock,
    "sell_count": sellCount,
    "addon_category_id": addonCategoryId,
    "tax_ids": taxIds == null ? [] : List<dynamic>.from(taxIds!.map((x) => x)),
    "translations": translations == null
        ? []
        : List<dynamic>.from(translations!.map((x) => x.toJson())),
  };
}

enum StockType { DAILY, LIMITED, UNLIMITED }

final stockTypeValues = EnumValues({
  "daily": StockType.DAILY,
  "limited": StockType.LIMITED,
  "unlimited": StockType.UNLIMITED,
});

class Translation {
  final int? id;
  final DataTypeEnum? translationableType;
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
    translationableType: dataTypeEnumValues.map[json["translationable_type"]]!,
    translationableId: json["translationable_id"],
    locale: localeValues.map[json["locale"]]!,
    key: translationKeyValues.map[json["key"]]!,
    value: json["value"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "translationable_type": dataTypeEnumValues.reverse[translationableType],
    "translationable_id": translationableId,
    "locale": localeValues.reverse[locale],
    "key": translationKeyValues.reverse[key],
    "value": value,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

enum TranslationKey { DESCRIPTION, NAME }

final translationKeyValues = EnumValues({
  "description": TranslationKey.DESCRIPTION,
  "name": TranslationKey.NAME,
});

enum Locale { EN }

final localeValues = EnumValues({"en": Locale.EN});

enum DataTypeEnum { APP_MODELS_ADD_ON, APP_MODELS_FOOD }

final dataTypeEnumValues = EnumValues({
  "App\\Models\\AddOn": DataTypeEnum.APP_MODELS_ADD_ON,
  "App\\Models\\Food": DataTypeEnum.APP_MODELS_FOOD,
});

class Allergy {
  final int? id;
  final String? allergy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AllergyPivot? pivot;

  Allergy({this.id, this.allergy, this.createdAt, this.updatedAt, this.pivot});

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
    id: json["id"],
    allergy: json["allergy"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : AllergyPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "allergy": allergy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class AllergyPivot {
  final int? foodId;
  final int? allergyId;

  AllergyPivot({this.foodId, this.allergyId});

  factory AllergyPivot.fromJson(Map<String, dynamic> json) =>
      AllergyPivot(foodId: json["food_id"], allergyId: json["allergy_id"]);

  Map<String, dynamic> toJson() => {"food_id": foodId, "allergy_id": allergyId};
}

enum Attributes { EMPTY }

final attributesValues = EnumValues({"[]": Attributes.EMPTY});

class CategoryId {
  final String? id;
  final int? position;
  final String? categoryName;

  CategoryId({this.id, this.position, this.categoryName});

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "category_name": categoryName,
  };
}

class Cuisine {
  final int? id;
  final String? name;
  final String? image;

  Cuisine({this.id, this.name, this.image});

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      Cuisine(id: json["id"], name: json["name"], image: json["image"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "image": image};
}

enum DiscountTypeEnum { AMOUNT, PERCENT }

final discountTypeEnumValues = EnumValues({
  "amount": DiscountTypeEnum.AMOUNT,
  "percent": DiscountTypeEnum.PERCENT,
});

class Nutrition {
  final int? id;
  final String? nutrition;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final NutritionPivot? pivot;

  Nutrition({
    this.id,
    this.nutrition,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
    id: json["id"],
    nutrition: json["nutrition"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null
        ? null
        : NutritionPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nutrition": nutrition,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class NutritionPivot {
  final int? foodId;
  final int? nutritionId;

  NutritionPivot({this.foodId, this.nutritionId});

  factory NutritionPivot.fromJson(Map<String, dynamic> json) => NutritionPivot(
    foodId: json["food_id"],
    nutritionId: json["nutrition_id"],
  );

  Map<String, dynamic> toJson() => {
    "food_id": foodId,
    "nutrition_id": nutritionId,
  };
}

enum RestaurantClosingTime { THE_1000, THE_1300, THE_2300, THE_2359 }

final restaurantClosingTimeValues = EnumValues({
  "10:00": RestaurantClosingTime.THE_1000,
  "13:00": RestaurantClosingTime.THE_1300,
  "23:00": RestaurantClosingTime.THE_2300,
  "23:59": RestaurantClosingTime.THE_2359,
});

enum RestaurantOpeningTime { THE_0001, THE_0100, THE_0200, THE_1000 }

final restaurantOpeningTimeValues = EnumValues({
  "00:01": RestaurantOpeningTime.THE_0001,
  "01:00": RestaurantOpeningTime.THE_0100,
  "02:00": RestaurantOpeningTime.THE_0200,
  "10:00": RestaurantOpeningTime.THE_1000,
});

class Storage {
  final int? id;
  final DataTypeEnum? dataType;
  final String? dataId;
  final StorageKey? key;
  final ValueEnum? value;
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
    dataType: dataTypeEnumValues.map[json["data_type"]]!,
    dataId: json["data_id"],
    key: storageKeyValues.map[json["key"]]!,
    value: valueEnumValues.map[json["value"]]!,
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data_type": dataTypeEnumValues.reverse[dataType],
    "data_id": dataId,
    "key": storageKeyValues.reverse[key],
    "value": valueEnumValues.reverse[value],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum StorageKey { IMAGE }

final storageKeyValues = EnumValues({"image": StorageKey.IMAGE});

enum ValueEnum { PUBLIC }

final valueEnumValues = EnumValues({"public": ValueEnum.PUBLIC});

class Tag {
  final int? id;
  final String? tag;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TagPivot? pivot;

  Tag({this.id, this.tag, this.createdAt, this.updatedAt, this.pivot});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    tag: json["tag"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : TagPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag": tag,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class TagPivot {
  final int? foodId;
  final int? tagId;

  TagPivot({this.foodId, this.tagId});

  factory TagPivot.fromJson(Map<String, dynamic> json) =>
      TagPivot(foodId: json["food_id"], tagId: json["tag_id"]);

  Map<String, dynamic> toJson() => {"food_id": foodId, "tag_id": tagId};
}

class Variation {
  final int? variationId;
  final Name? name;
  final Type? type;
  final dynamic min;
  final dynamic max;
  final Required? required;
  final List<ValueElement>? values;

  Variation({
    this.variationId,
    this.name,
    this.type,
    this.min,
    this.max,
    this.required,
    this.values,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    variationId: json["variation_id"],
    name: nameValues.map[json["name"]]!,
    type: typeValues.map[json["type"]]!,
    min: json["min"],
    max: json["max"],
    required: requiredValues.map[json["required"]]!,
    values: json["values"] == null
        ? []
        : List<ValueElement>.from(
            json["values"]!.map((x) => ValueElement.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "variation_id": variationId,
    "name": nameValues.reverse[name],
    "type": typeValues.reverse[type],
    "min": min,
    "max": max,
    "required": requiredValues.reverse[required],
    "values": values == null
        ? []
        : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

enum Name { CAPACITY, SIZE, SUGER }

final nameValues = EnumValues({
  "Capacity": Name.CAPACITY,
  "Size": Name.SIZE,
  "Suger": Name.SUGER,
});

enum Required { OFF, ON }

final requiredValues = EnumValues({"off": Required.OFF, "on": Required.ON});

enum Type { MULTI, SINGLE }

final typeValues = EnumValues({"multi": Type.MULTI, "single": Type.SINGLE});

class ValueElement {
  final String? label;
  final dynamic optionPrice;
  final String? totalStock;
  final StockType? stockType;
  final String? sellCount;
  final int? optionId;
  final int? currentStock;

  ValueElement({
    this.label,
    this.optionPrice,
    this.totalStock,
    this.stockType,
    this.sellCount,
    this.optionId,
    this.currentStock,
  });

  factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
    label: json["label"],
    optionPrice: json["optionPrice"],
    totalStock: json["total_stock"],
    stockType: stockTypeValues.map[json["stock_type"]]!,
    sellCount: json["sell_count"],
    optionId: json["option_id"],
    currentStock: json["current_stock"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "optionPrice": optionPrice,
    "total_stock": totalStock,
    "stock_type": stockTypeValues.reverse[stockType],
    "sell_count": sellCount,
    "option_id": optionId,
    "current_stock": currentStock,
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
