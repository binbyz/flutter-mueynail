import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';

final List<String> images = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class TodayArtCarousel extends StatefulWidget {
  const TodayArtCarousel({Key? key}) : super(key: key);

  @override
  State<TodayArtCarousel> createState() => _TodayArtCarouselState();
}

class _TodayArtCarouselState extends State<TodayArtCarousel> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: 340,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 15),
        aspectRatio: 5.0,
        enlargeCenterPage: false,
      ),
      itemBuilder: (context, index, realIdx) {
        return makeCarouselItem(index: index);
      },
    );
  }

  Widget makeCarouselItem({required int index}) {
    return Container(
      width: 340,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(images[index], fit: BoxFit.cover, width: 340),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 5,
                child: ElevatedButton(
                  child: const Text('예약'),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '베이비치크',
                  maxLines: 1,
                  style: titleTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  '꾸안꾸 스타일의 베이비 치크 화려한 스타일을 좋아하지 않은 고객들에게 딱이예요!',
                  maxLines: 3,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: summaryTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
