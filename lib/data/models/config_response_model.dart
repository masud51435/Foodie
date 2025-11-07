// To parse this JSON data, do
//
//     final configResponseModel = configResponseModelFromJson(jsonString);

import 'dart:convert';

ConfigResponseModel configResponseModelFromJson(String str) =>
    ConfigResponseModel.fromJson(json.decode(str));

String configResponseModelToJson(ConfigResponseModel data) =>
    json.encode(data.toJson());

class ConfigResponseModel {
  final String? businessName;
  final String? logo;
  final String? logoFullUrl;
  final String? address;
  final String? phone;
  final String? email;
  final String? country;

  ConfigResponseModel({
    this.businessName,
    this.logo,
    this.logoFullUrl,
    this.address,
    this.phone,
    this.email,
    this.country,
  });

  ConfigResponseModel copyWith({
    String? businessName,
    String? logo,
    String? logoFullUrl,
    String? address,
    String? phone,
    String? email,
    String? country,
  }) => ConfigResponseModel(
    businessName: businessName ?? this.businessName,
    logo: logo ?? this.logo,
    logoFullUrl: logoFullUrl ?? this.logoFullUrl,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    country: country ?? this.country,
  );

  factory ConfigResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfigResponseModel(
        businessName: json["business_name"],
        logo: json["logo"],
        logoFullUrl: json["logo_full_url"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
    "business_name": businessName,
    "logo": logo,
    "logo_full_url": logoFullUrl,
    "address": address,
    "phone": phone,
    "email": email,
    "country": country,
  };
}
