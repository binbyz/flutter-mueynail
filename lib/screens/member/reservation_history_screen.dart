import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mueynail/app/components/common_app_bar.dart';
import 'package:mueynail/app/entities/art/art_detail_model.dart';
import 'package:mueynail/app/entities/reservation/reservation_history_model.dart';
import 'package:mueynail/app/enum/art_status.dart';
import 'package:mueynail/app/enum/reservation_step.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/screens/home/components/art_detail_layer.dart';

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

final List<ReservationHistoryModel> histories = [
  ReservationHistoryModel(
      id: 1,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 2,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 3,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 4,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 5,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 6,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 7,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 8,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 9,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
  ReservationHistoryModel(
      id: 10,
      status: ReservationStep.end,
      createdAt: DateTime.now(),
      artDetail: artList[Random().nextInt(artList.length)]),
];

class ReservationHistoryScreen extends StatelessWidget {
  const ReservationHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: const CommonAppBar(title: '예약 내역'),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: histories.length,
        itemBuilder: (BuildContext context, int index) {
          final item = histories[index];

          int dayAgo = item.createdAt.difference(now).inDays;

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
                    showArtDetailLayer(context, item.artDetail);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 26,
                        child: CircleAvatar(backgroundImage: NetworkImage(item.artDetail.thumbnailUrl), radius: 25),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 140,
                        child: Text(
                          item.artDetail.name,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle.copyWith(fontSize: 16),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('재예약', overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
