import 'package:flutter/material.dart';
import 'package:mueynail/component/content_box.dart';
import 'package:mueynail/component/home/event_scorllview.dart';
import 'package:mueynail/component/home/today_art_carousel.dart';
import 'package:mueynail/component/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ContentBox(
              title: '이달의 아트',
              contentPadding: 0,
              children: TodayArtCarousel(),
            ),
            ContentBox(
              title: '이벤트 소식',
              children: EventScrollview(),
            ),
            ContentBox(
              title: '따듯한 고객 후기',
              children: EventScrollview(),
            ),
          ],
        ),
      ),
    );
  }
}
