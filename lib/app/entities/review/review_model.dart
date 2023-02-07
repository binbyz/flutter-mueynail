import 'package:mueynail/app/entities/art/art_detail_model.dart';
import 'package:mueynail/app/enum/review_status.dart';

class ReviewModel {
  final int id;
  final ReviewStatus status;
  final int memberId;
  final String? content;
  final int? point;
  final DateTime? reviewedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ArtDetailModel artDetail;

  const ReviewModel({
    required this.id,
    required this.status,
    required this.memberId,
    required this.content,
    required this.point,
    required this.reviewedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.artDetail,
  });
}
