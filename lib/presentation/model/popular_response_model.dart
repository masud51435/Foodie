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
  final int? price;
  final int? tax;
  final int? discount;
  final int? veg;
  final int? status;
  final int? restaurantId;
  final int? orderCount;
  final double? avgRating;
  final int? ratingCount;
  final int? recommended;
  final String? slug;
  final dynamic maximumCartQuantity;
  final int? isHalal;
  final int? itemStock;
  final int? sellCount;
  final int? tempAvailable;
  final int? open;
  final int? reviewsCount;
  final String? restaurantName;
  final int? restaurantStatus;
  final int? restaurantDiscount;
  final bool? scheduleOrder;
  final int? minDeliveryTime;
  final int? maxDeliveryTime;
  final int? freeDelivery;
  final int? halalTagStatus;
  final String? imageFullUrl;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.price,
    this.tax,
    this.discount,
    this.veg,
    this.status,
    this.restaurantId,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.recommended,
    this.slug,
    this.maximumCartQuantity,
    this.isHalal,
    this.itemStock,
    this.sellCount,
    this.tempAvailable,
    this.open,
    this.reviewsCount,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.scheduleOrder,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.freeDelivery,
    this.halalTagStatus,
    this.imageFullUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryId: json["category_id"],
    price: json["price"],
    tax: json["tax"],
    discount: json["discount"],
    veg: json["veg"],
    status: json["status"],
    restaurantId: json["restaurant_id"],
    orderCount: json["order_count"],
    avgRating: json["avg_rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    recommended: json["recommended"],
    slug: json["slug"],
    maximumCartQuantity: json["maximum_cart_quantity"],
    isHalal: json["is_halal"],
    itemStock: json["item_stock"],
    sellCount: json["sell_count"],
    tempAvailable: json["temp_available"],
    open: json["open"],
    reviewsCount: json["reviews_count"],
    restaurantName: json["restaurant_name"],
    restaurantStatus: json["restaurant_status"],
    restaurantDiscount: json["restaurant_discount"],
    scheduleOrder: json["schedule_order"],
    minDeliveryTime: json["min_delivery_time"],
    maxDeliveryTime: json["max_delivery_time"],
    freeDelivery: json["free_delivery"],
    halalTagStatus: json["halal_tag_status"],
    imageFullUrl: json["image_full_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "price": price,
    "tax": tax,
    "discount": discount,
    "veg": veg,
    "status": status,
    "restaurant_id": restaurantId,
    "order_count": orderCount,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "recommended": recommended,
    "slug": slug,
    "maximum_cart_quantity": maximumCartQuantity,
    "is_halal": isHalal,
    "item_stock": itemStock,
    "sell_count": sellCount,
    "temp_available": tempAvailable,
    "open": open,
    "reviews_count": reviewsCount,
    "restaurant_name": restaurantName,
    "restaurant_status": restaurantStatus,
    "restaurant_discount": restaurantDiscount,
    "schedule_order": scheduleOrder,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "free_delivery": freeDelivery,
    "halal_tag_status": halalTagStatus,
    "image_full_url": imageFullUrl,
  };
}
