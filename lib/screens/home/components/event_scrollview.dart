import 'package:flutter/material.dart';
import 'package:mueynail/app/http/api.dart';
import 'package:mueynail/app/models/shop/event_model.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/screens/components/ink_well_card.dart';
import 'package:mueynail/screens/home/components/event_detail_modal.dart';

class EventScrollview extends StatefulWidget {
  const EventScrollview({Key? key}) : super(key: key);

  @override
  State<EventScrollview> createState() => _EventScrollviewState();
}

class _EventScrollviewState extends State<EventScrollview> {
  late Future<List<EventModel>> _eventList;
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _eventList = fetchEventList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: _eventList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return _buildEventList(snapshot.data!);
        }
      },
    );
  }

  Widget _buildEventList(List<EventModel> events) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int i) {
          final event = events[i];

          int remainDays = event.endedAt.difference(now).inDays;
          String remainText = (remainDays > 0) ? '$remainDays일 남음' : '마감';

          return InkWellCard(
            callback: () {
              showEventDetailModal(context, event);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      event.title,
                      overflow: TextOverflow.ellipsis,
                      style: brandTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.grey, size: 16),
                      const SizedBox(width: 2),
                      Text(
                        remainText,
                        style: summaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: Flexible(
                      child: Text(
                        event.summary,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
