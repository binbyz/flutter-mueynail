import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mueynail/app/components/common_app_bar.dart';
import 'package:mueynail/app/entities/art/art_detail_model.dart';
import 'package:mueynail/app/entities/review/review_model.dart';
import 'package:mueynail/app/enum/art_status.dart';
import 'package:mueynail/app/enum/review_status.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/screens/home/components/art_detail_layer.dart';
import 'package:mueynail/screens/member/components/review_layer.dart';

final List<ArtDetailModel> artList = [
  const ArtDetailModel(
    id: 1,
    status: ArtStatus.opened,
    name: '핑크브러쉬',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 2,
    status: ArtStatus.opened,
    name: '커튼펄',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 3,
    status: ArtStatus.opened,
    name: '설레임하트',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 4,
    status: ArtStatus.opened,
    name: '러브라인',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 5,
    status: ArtStatus.opened,
    name: '민서의 사랑',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
  const ArtDetailModel(
    id: 6,
    status: ArtStatus.opened,
    name: '긴 이름의 아트 이름은 어떻게 표시될까요',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    detailUrl:
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    description: '세상에 하나밖에 없는\n단 한 사람만을 위한\n아트입니다.',
  ),
];

final List<ReviewModel> reviewList = [
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    reviewedAt: null,
    content: null,
    point: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.reviewed,
    memberId: 1,
    content: "꼼꼼한 시술 감사합니다!",
    point: 1,
    reviewedAt: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    content: null,
    point: null,
    reviewedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    content: null,
    point: null,
    reviewedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    content: null,
    point: null,
    reviewedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    content: null,
    point: null,
    reviewedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.pending,
    memberId: 1,
    content: null,
    point: null,
    reviewedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
  ReviewModel(
    id: 1,
    status: ReviewStatus.reviewed,
    memberId: 1,
    content: "",
    point: 1,
    reviewedAt: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    artDetail: artList[Random().nextInt(artList.length)],
  ),
];

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '후기 작성'),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reviewList.length,
        itemBuilder: (BuildContext context, int index) {
          final review = reviewList[index];

          int dayAgo = review.createdAt.difference(DateTime.now()).inDays;

          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12.withOpacity(0.1), width: 1),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.black45),
                const SizedBox(width: 10),
                Text(dayAgo == 0 ? '오늘' : '$dayAgo일 전', style: summaryTextStyle),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showArtDetailLayer(context, review.artDetail);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 26,
                        child: CircleAvatar(backgroundImage: NetworkImage(review.artDetail.thumbnailUrl), radius: 25),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.artDetail.name,
                              overflow: TextOverflow.ellipsis,
                              style: titleTextStyle.copyWith(fontSize: 16),
                              maxLines: 1,
                            ),
                            Text(
                              review.content ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: summaryTextStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: buildReviewButton(context, review),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ElevatedButton buildReviewButton(BuildContext context, ReviewModel review) {
    final text = review.status == ReviewStatus.reviewed ? '리뷰수정' : '리뷰작성';

    final style = review.status == ReviewStatus.reviewed
        ? ElevatedButton.styleFrom(
            backgroundColor: Colors.black54,
          )
        : ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          );

    return ElevatedButton(
      onPressed: () {
        buildReviewModal(context, review);
      },
      style: style,
      child: Text(text, overflow: TextOverflow.ellipsis),
    );
  }

  void buildReviewModal(BuildContext context, ReviewModel review) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ReviewLayer(review: review),
      ),
    );
  }
}
