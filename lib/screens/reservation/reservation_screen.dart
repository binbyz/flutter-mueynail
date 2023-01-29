import 'package:flutter/material.dart';
import 'package:mueynail/app/components/app_checkbox_list_title.dart';
import 'package:mueynail/app/enum/art_group_enum.dart';

import '../home/components/content_box.dart';
import '../home/components/home_app_bar.dart';
import 'components/reservation_button.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              optionArtGroup(),
            ],
          ),
          const ReservationButton(),
        ],
      ),
    );
  }

  ContentBox optionArtGroup() {
    return ContentBox(
      title: '아트 선택',
      children: Column(
        children: [
          AppCheckboxListTitle(
            label: ArtGroupEnum.todayArt.label,
            children: const [
              AppCheckboxListTitle(label: '베이베치크'),
              AppCheckboxListTitle(label: '베이베치크'),
              AppCheckboxListTitle(label: '베이베치크'),
              AppCheckboxListTitle(label: '베이베치크'),
              AppCheckboxListTitle(label: '베이베치크'),
            ],
          ),
          AppCheckboxListTitle(label: ArtGroupEnum.oneTone.label),
          AppCheckboxListTitle(label: ArtGroupEnum.french.label),
          AppCheckboxListTitle(label: ArtGroupEnum.custom.label),
        ],
      ),
    );
  }
}
