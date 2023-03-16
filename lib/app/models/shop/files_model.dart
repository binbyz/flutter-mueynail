class Files {
  List<Images> images;
  MainImage mainImage;

  Files.fromJson(Map<String, dynamic> json)
      : images =
  (json['images'] as List).map((i) => Images.fromJson(i)).toList(),
        mainImage = MainImage.fromJson(json['main_image']);
}

class Images {
  int id;
  String fullUrl;

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullUrl = json['full_url'];
}

class MainImage {
  int id;
  String fullUrl;

  MainImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullUrl = json['full_url'];
}