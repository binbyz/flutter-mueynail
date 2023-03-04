import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mueynail/app/http/api.dart';
import 'package:mueynail/app/models/shop/art.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/screens/home/components/art_detail_layer.dart';

class TheMonthArtCarousel extends StatefulWidget {
  const TheMonthArtCarousel({Key? key}) : super(key: key);

  @override
  State<TheMonthArtCarousel> createState() => _TheMonthArtCarouselState();
}

class _TheMonthArtCarouselState extends State<TheMonthArtCarousel> {
  List<Art> artList = [];

  @override
  void initState() {
    super.initState();

    fetchArtMonthPick().then((picks) {
      for (var art in picks) {
        precacheImage(
            NetworkImage(art.files['main_image']['full_url']), context);
      }

      // 이달의 아트 가져오기
      setState(() {
        artList = picks;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
        itemCount: artList.length,
        options: CarouselOptions(
          height: 340,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 15),
          aspectRatio: 5.0,
          enlargeCenterPage: false,
        ),
        itemBuilder: (context, index, realIdx) {
          return makeCarouselItem(context, artList[index]);
        },
      ),
    );
  }

  Widget makeCarouselItem(BuildContext context, Art art) {
    return Container(
      width: 340,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showArtDetailLayer(context, art);
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  art.files['main_image']['full_url'],
                  fit: BoxFit.fitWidth,
                  width: 340,
                  height: 240,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery
                .of(context)
                .size
                .width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  art.name,
                  maxLines: 1,
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  art.description,
                  maxLines: 3,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: summaryTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
