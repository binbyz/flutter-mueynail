import 'package:flutter/material.dart';
import 'package:mueynail/app/components/common_app_bar.dart';

class ArtListScreen extends StatelessWidget {
  const ArtListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '아트 컬렉션'),
      body: Center(
        child: Text('Center'),
      ),
    );
  }
}
