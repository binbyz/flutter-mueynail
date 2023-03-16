import 'package:mueynail/app/models/enums/shop/event_state.dart';
import 'package:mueynail/app/models/shop/files_model.dart';

class EventModel {
  final int id;
  final int shopId;
  final EventState state;
  final String title;
  final String summary;
  final String description;
  final Files files;
  final String endedAt;
  final String createdAt;
  final String updatedAt;

  EventModel({
    required this.id,
    required this.shopId,
    required this.state,
    required this.title,
    required this.summary,
    required this.description,
    required this.files,
    required this.endedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      shopId: json['shop_id'],
      state: EventStateExtension.fromValue(json['state']),
      title: json['title'],
      summary: json['summary'],
      description: json['description'],
      files: Files.fromJson(json['files']),
      endedAt: json['ended_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}