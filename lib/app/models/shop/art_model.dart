import 'package:mueynail/app/models/enums/shop/art_state.dart';

class ArtModel {
  final int id;
  final int shopId;
  final ArtState state;
  final bool pick;
  final List<int> categories;
  final String name;
  final String summary;
  final String description;
  final int price;
  final Map<String, dynamic> files;
  final String createdAt;
  final String updatedAt;
  final List<CategoryLabel> categoriesLabel;

  ArtModel({
    required this.id,
    required this.shopId,
    required this.state,
    required this.pick,
    required this.categories,
    required this.name,
    required this.summary,
    required this.description,
    required this.price,
    required this.files,
    required this.createdAt,
    required this.updatedAt,
    required this.categoriesLabel,
  });

  factory ArtModel.fromJson(Map<String, dynamic> json) {
    return ArtModel(
      id: json['id'],
      shopId: json['shop_id'],
      state: ArtStateExtension.fromValue(json['state']),
      pick: json['pick'],
      categories: List<int>.from(json['categories']),
      name: json['name'],
      summary: json['summary'],
      description: json['description'],
      price: json['price'],
      files: json['files'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoriesLabel: List<CategoryLabel>.from(json['categories_label']
          .map((labelJson) => CategoryLabel.fromJson(labelJson))),
    );
  }
}

class CategoryLabel {
  final int id;
  final String label;

  CategoryLabel({required this.id, required this.label});

  factory CategoryLabel.fromJson(Map<String, dynamic> json) {
    return CategoryLabel(id: json['id'], label: json['label']);
  }
}