import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('예약하기'),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: elevatedSupplementaryStyle,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.question_answer_outlined, color: primaryColor, size: 16),
                      SizedBox(width: 5),
                      Text('문의'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
