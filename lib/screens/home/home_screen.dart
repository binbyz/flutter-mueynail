import 'package:flutter/material.dart';
import 'package:mueynail/screens/home/components/season_off_art.dart';

import 'components/content_box.dart';
import 'components/event_scrollview.dart';
import 'components/today_art_carousel.dart';
import 'home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: SizedBox(
                height: 310,
                child: TodayArtCarousel(),
              ),
            ),
            ContentBox(
              title: '이벤트 소식',
              child: EventScrollview(),
            ),
            ContentBox(
              title: '아트 모음',
              contentPadding: 0,
              child: SeasonOffArtCollection(),
            ),
            ContentBox(
              title: '따듯한 고객 후기',
              child: EventScrollview(),
            ),
          ],
        ),
      ),
    );
  }
}
