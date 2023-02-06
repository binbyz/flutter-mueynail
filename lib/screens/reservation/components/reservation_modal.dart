import 'package:flutter/material.dart';
import 'package:mueynail/app/enum/reservation_step_enum.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';

void showReservationModal(BuildContext context, ReservationStep currentStep) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: primaryColor, width: 2),
        ),
        title: Text('예약 상태', style: titleTextStyle),
        content: SizedBox(
          height: 270,
          width: 320,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text('현재 진행 중인 예약이 있습니다.', style: titleTextStyle),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ..._reservationStep(currentStep),
                ],
              ),
              ..._reservationDescription(currentStep),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('내 정보로 이동')),
        ],
      );
    },
  );
}

List<Widget> _reservationStep(ReservationStep currentStep) {
  bool progressing = true;
  final activeTextStyle = summaryTextStyle.copyWith(color: primaryColor);

  return ReservationStep.values.map((step) {
    var statusIcon = progressing
        ? const Icon(Icons.check_circle, size: 30, color: primaryColor)
        : const Icon(Icons.check_circle_outline, size: 30, color: primaryColorOpacity);

    if (step == currentStep) {
      progressing = false;
    }

    return Column(
      children: [
        statusIcon,
        const SizedBox(height: 10),
        Text(step.label, style: (currentStep != step) ? summaryTextStyle : activeTextStyle),
      ],
    );
  }).toList();
}

List<Widget> _reservationDescription(ReservationStep currentStep) {
  List<Widget> descriptions = [
    Text(currentStep.description, style: normalTextStyle),
  ];

  if (currentStep == ReservationStep.applyChecked) {
    descriptions.insert(0, const SizedBox(height: 15));
    descriptions.addAll([
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(accountBank),
          Text(' (예금주: $accountName)', style: TextStyle(color: primaryColor)),
        ],
      ),
      const Text(accountNumber),
    ]);
  } else {
    descriptions.insert(0, const SizedBox(height: 60));
  }

  return descriptions;
}