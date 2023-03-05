import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mueynail/app/http/api.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';
import 'package:mueynail/screens/home/components/art_detail_layer.dart';

class MonthPickArtCarousel extends StatefulWidget {
  const MonthPickArtCarousel({Key? key}) : super(key: key);

  @override
  State<MonthPickArtCarousel> createState() => _MonthPickArtCarouselState();
}

class _MonthPickArtCarouselState extends State<MonthPickArtCarousel> {
  late Future<List<ArtModel>> _artList;

  @override
  void initState() {
    super.initState();
    _artList = fetchArtMonthPick();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtModel>>(
        future: _artList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              child: CarouselSlider.builder(
                itemCount: snapshot.data?.length,
                options: CarouselOptions(
                  height: 340,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 15),
                  aspectRatio: 5.0,
                  enlargeCenterPage: false,
                ),
                itemBuilder: (context, index, realIdx) {
                  return makeCarouselItem(context, snapshot.data![index]);
                },
              ),
            );
          }
        });
  }

  Widget makeCarouselItem(BuildContext context, ArtModel art) {
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
                  art.files.mainImage.fullUrl!,
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width / 2,
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
