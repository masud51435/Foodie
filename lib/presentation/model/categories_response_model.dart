// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesResponseModel> categoriesResponseModelFromJson(String str) => List<CategoriesResponseModel>.from(json.decode(str).map((x) => CategoriesResponseModel.fromJson(x)));

String categoriesResponseModelToJson(List<CategoriesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesResponseModel {
    final int? id;
    final String? name;
    final String? image;
    final int? parentId;
    final int? position;
    final int? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? priority;
    final String? slug;
    final int? productsCount;
    final int? childesCount;
    final dynamic orderCount;
    final String? imageFullUrl;
    final List<Translation>? translations;
    final List<Storage>? storage;
    final List<CategoriesResponseModel>? childes;

    CategoriesResponseModel({
        this.id,
        this.name,
        this.image,
        this.parentId,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.priority,
        this.slug,
        this.productsCount,
        this.childesCount,
        this.orderCount,
        this.imageFullUrl,
        this.translations,
        this.storage,
        this.childes,
    });

    factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => CategoriesResponseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        slug: json["slug"],
        productsCount: json["products_count"],
        childesCount: json["childes_count"],
        orderCount: json["order_count"],
        imageFullUrl: json["image_full_url"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
        storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
        childes: json["childes"] == null ? [] : List<CategoriesResponseModel>.from(json["childes"]!.map((x) => CategoriesResponseModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
        "slug": slug,
        "products_count": productsCount,
        "childes_count": childesCount,
        "order_count": orderCount,
        "image_full_url": imageFullUrl,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
        "childes": childes == null ? [] : List<dynamic>.from(childes!.map((x) => x.toJson())),
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

enum Type {
    APP_MODELS_CATEGORY
}

final typeValues = EnumValues({
    "App\\Models\\Category": Type.APP_MODELS_CATEGORY
});

enum StorageKey {
    IMAGE
}

final storageKeyValues = EnumValues({
    "image": StorageKey.IMAGE
});

enum Value {
    PUBLIC
}

final valueValues = EnumValues({
    "public": Value.PUBLIC
});

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
    NAME
}

final translationKeyValues = EnumValues({
    "name": TranslationKey.NAME
});

enum Locale {
    EN
}

final localeValues = EnumValues({
    "en": Locale.EN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
