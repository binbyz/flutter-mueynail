import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  const ImageViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView(
        imageProvider: NetworkImage(imageUrl),
    );
  }
}
