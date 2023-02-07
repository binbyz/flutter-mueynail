import 'package:mueynail/app/entities/art/art_detail_model.dart';
import 'package:mueynail/app/enum/reservation_step.dart';

class ReservationHistoryModel {
  final int id;
  final ReservationStep status;
  final DateTime createdAt;
  final ArtDetailModel artDetail;

  const ReservationHistoryModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.artDetail,
  });
}
