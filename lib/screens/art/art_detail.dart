import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:mueynail/app/entities/art/art_detail_model.dart';

const ArtDetailModel detailModel = ArtDetailModel(
  id: 1,
  name: '커리뽕뿌리',
  url:
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  summary: '세상에서 하나뿐인 아트',
);

class ArtDetail extends StatelessWidget {
  const ArtDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
