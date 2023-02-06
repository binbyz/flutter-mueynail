import 'package:flutter/material.dart';
import 'package:mueynail/app/components/ink_well_card.dart';
import 'package:mueynail/constants/style.dart';

final now = DateTime.now();

final List<Map<String, String>> events = [
  {
    "title": "신년맞이 할인",
    "summary": "모든 아트 100% 할인",
    "content": "신년맞이 모든 아트 100% 할인합니다. 조기 종료될 수 있으니 서두르세요!",
    "end_at": "2023-06-01 00:00:00",
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
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int i) {
          final event = events[i];

          DateTime endAt = DateTime.parse(event['end_at']!);
          int remainDays = endAt.difference(now).inDays;
          String remainText = (remainDays > 0) ? '$remainDays일 남음' : '마감';

          return InkWellCard(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      event['title']!,
                      overflow: TextOverflow.ellipsis,
                      style: brandTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      event['summary']!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  Text(remainText, style: summaryTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
