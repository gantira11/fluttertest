// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel extends Equatable {
  BannerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  int id;
  String title;
  String description;
  String image;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
        isActive,
        createdAt,
        updatedAt,
        imageUrl,
      ];
}
