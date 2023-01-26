import 'package:flutter/material.dart';
import 'package:mueynail/const/style.dart';

final now = DateTime.now();

final List<Map<String, String>> events = [
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-02-01 00:00:00",
  },
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-02-01 00:00:00",
  },
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-02-01 00:00:00",
  },
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-01-03 00:00:00",
  },
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-01-01 00:00:00",
  },
];

class EventScrollview extends StatelessWidget {
  const EventScrollview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int i) {
          final event = events[i];

          DateTime endAt = DateTime.parse(event['end_at']!);
          int remainDays = endAt.difference(now).inDays;
          String remainText = (remainDays > 0) ? '$remainDays일 남음' : '마감';

          return Card(
            child: Container(
              decoration: (remainDays > 0) ? positiveBoxDecoration : negativeBoxDecoration,
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(event['title']!),
                  Text(event['summary']!),
                  Text(remainText),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
