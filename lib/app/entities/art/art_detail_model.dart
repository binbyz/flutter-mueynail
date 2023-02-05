import 'package:flutter/material.dart';

class ArtDetailModel {
  final int id;
  final String name;
  final String thumbnailUrl;
  final String detailUrl;
  final Color? color;
  final String description;

  const ArtDetailModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.detailUrl,
    required this.description,
    this.color,
  });
}
