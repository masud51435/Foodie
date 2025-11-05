// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesResponseModel> categoriesResponseModelFromJson(String str) =>
    List<CategoriesResponseModel>.from(
      json.decode(str).map((x) => CategoriesResponseModel.fromJson(x)),
    );

String categoriesResponseModelToJson(List<CategoriesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoriesResponseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
        slug: json["slug"],
        productsCount: json["products_count"],
        childesCount: json["childes_count"],
        orderCount: json["order_count"],
        imageFullUrl: json["image_full_url"],
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
  };
}
