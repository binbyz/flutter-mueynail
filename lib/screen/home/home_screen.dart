import 'package:flutter/material.dart';

import 'components/content_box.dart';
import 'components/event_scorllview.dart';
import 'components/home_app_bar.dart';
import 'components/today_art_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
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
