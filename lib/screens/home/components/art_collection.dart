import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mueynail/app/entities/art/art_detail_model.dart';
import 'package:mueynail/screens/art/art_collection_screen.dart';
import 'package:mueynail/screens/art/components/art_detail_modal.dart';

final List<ArtDetailModel> artList = [
  const ArtDetailModel(
    id: 1,
    name: '핑크브러쉬',
    thumbnailUrl:
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    detailUrl: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 2,
    name: '커튼펄',
    thumbnailUrl:
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    detailUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 3,
    name: '설레임하트',
    thumbnailUrl:
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    detailUrl: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 4,
    name: '러브라인',
    thumbnailUrl:
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    detailUrl: 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 5,
    name: '민서의 사랑',
    thumbnailUrl:
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    detailUrl: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
];

class ArtCollection extends StatelessWidget {
  const ArtCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: InfiniteCarousel.builder(
            itemCount: artList.length,
            itemExtent: 200,
            loop: true,
            anchor: 0.0,
            velocityFactor: 0.2,
            itemBuilder: (context, index, realIndex) {
              return makeCarouselItem(context: context, detailModel: artList[index]);
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ArtCollectionScreen()),
              );
            },
            child: const Icon(Icons.more_horiz_rounded),
          ),
        ),
      ],
    );
  }

  Widget makeCarouselItem({required BuildContext context, required ArtDetailModel detailModel}) {
    return GestureDetector(
      onTap: () {
        showArtDetailModal(context, detailModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(detailModel.thumbnailUrl, fit: BoxFit.cover, height: 200),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Text(detailModel.name, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
