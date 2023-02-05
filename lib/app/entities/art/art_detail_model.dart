import 'package:flutter/material.dart';

class ArtDetailModel {
  final int id;
  final String name;
  final String thumbnailUrl;
  final String detailUrl;
  final String description;
  final Color? color;
  final int? price;

  const ArtDetailModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.detailUrl,
    required this.description,
    this.color,
    this.price,
  });
}
