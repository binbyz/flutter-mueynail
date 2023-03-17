import 'package:flutter/material.dart';
import 'package:mueynail/app/models/shop/event_model.dart';
import 'package:mueynail/constants/style.dart';

class EventDetailModal extends StatefulWidget {
  final EventModel event;

  const EventDetailModal({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailModal> createState() => _EventDetailModalState();
}

class _EventDetailModalState extends State<EventDetailModal> {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('이벤트 상세', style: summaryTextStyle),
                const SizedBox(height: 20),
                Text(widget.event.title,
                    style: titleTextStyle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                    const SizedBox(width: 2),
                    Text(
                      widget.event.endedAt.difference(now).inDays > 0
                          ? '${widget.event.endedAt.difference(now).inDays}일 남음'
                          : '마감',
                      style: summaryTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.event.description,
                  style: normalTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showEventDetailModal(BuildContext context, EventModel event) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return EventDetailModal(event: event);
    },
  );
}
