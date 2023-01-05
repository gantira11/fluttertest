// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile extends Equatable {
  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
  });

  int id;
  String name;
  String email;
  String phone;
  DateTime emailVerifiedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, name, email, phone, emailVerifiedAt];
}
