import 'art_detail_model.dart';

class ArtGroupModel {
  final int id;
  final String name;
  final List<ArtDetailModel> artList;

  const ArtGroupModel({
    required this.id,
    required this.name,
    required this.artList,
  });
}
