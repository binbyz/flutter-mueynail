import 'package:flutter/material.dart';

class ArtDetailModel {
  final int id;
  final String name;
  final String url;
  final Color? color;
  final String description;
  final String summary;

  const ArtDetailModel({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.summary,
    this.color,
  });
}
