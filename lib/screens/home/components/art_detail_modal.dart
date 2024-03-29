import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';
import 'package:mueynail/screens/image_viewer.dart';

class ArtDetailModal extends StatefulWidget {
  final ArtModel art;

  const ArtDetailModal({Key? key, required this.art}) : super(key: key);

  @override
  State<ArtDetailModal> createState() => _ArtDetailModalState();
}

class _ArtDetailModalState extends State<ArtDetailModal> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Stack(
        children: [
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: CarouselSlider.builder(
                      itemCount: widget.art.files.images.length,
                      options: CarouselOptions(
                        height: imageHeight + 30,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return enlargeSingleImage(context, widget.art.files.images[index].fullUrl);
                      },
                    ),
                  ),
                  carouselIndicator(),
                  const SizedBox(height: 20),
                  Text(widget.art.name, style: titleTextStyle),
                  const SizedBox(height: 20),
                  Text(widget.art.description,
                      style: summaryTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0, bottom: 30, child: bottomReservationOrLike(context)),
        ],
      ),
    );
  }

  /// 이미지 미리보기 및 클릭시 확대
  Widget enlargeSingleImage(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) =>
                  ImageViewer(imageUrl: imageUrl)),
        );
      },
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: imageHeight + 30,
              ),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 5,
            child: Container(
              color: Colors.black.withOpacity(0.6),
              width: 25,
              height: 25,
              child: const Icon(Icons.fitness_center_rounded,
                  color: Colors.white, size: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// 이미지 Indicator
  Widget carouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...widget.art.files.images.asMap().entries.map((e) {
          return Container(
            width: 6.0,
            height: 6.0,
            margin: const EdgeInsets.fromLTRB(2, 15, 2, 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(
                  (_current == e.key) ? 0.9 : 0.4,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  /// 예약하기 버튼 및 좋아요 버튼
  Widget bottomReservationOrLike(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('예약하기'))),
          const SizedBox(width: 5),
          ElevatedButton(
            onPressed: () {},
            style: elevatedSupplementaryStyle,
            child: const Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}

/// 아트 상세보기 바텀시트 호출 함수
void showArtDetailModal(BuildContext context, ArtModel art) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (builder) {
      return ArtDetailModal(art: art);
    },
  );
}
