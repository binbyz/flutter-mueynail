import 'package:flutter/material.dart';
import 'package:mueynail/app/enum/art_status.dart';

class ArtDetailModel {
  final int id;
  final ArtStatus status;
  final String name;
  final String thumbnailUrl;
  final String detailUrl;
  final String description;
  final Color? color;
  final int? price;
  final int? goodPoint;
  final int? badPoint;
  final int? reservationCount;

  const ArtDetailModel({
    required this.id,
    required this.status,
    required this.name,
    required this.thumbnailUrl,
    required this.detailUrl,
    required this.description,
    this.color,
    this.price,
    this.goodPoint,
    this.badPoint,
    this.reservationCount,
  });
}
