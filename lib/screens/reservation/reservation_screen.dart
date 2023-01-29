import 'package:flutter/material.dart';
import 'package:mueynail/app/components/app_checkbox_list_title.dart';
import 'package:mueynail/app/enum/art_group_enum.dart';
import 'package:mueynail/constants/color.dart';

import '../home/components/content_box.dart';
import '../home/components/home_app_bar.dart';
import 'components/reservation_button.dart';

const String iconUrl =
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';

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
          ListView(
            children: [
              optionNailPediGroup(),
              optionArtGroup(),
              optionTipExtensionGroup(),
            ],
          ),
          const ReservationButton(),
        ],
      ),
    );
  }

  ContentBox optionNailPediGroup() {
    return ContentBox(
      title: '네일/패디',
      children: Row(
        children: [
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '네일', affinity: ListTileControlAffinity.leading)),
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '패디', affinity: ListTileControlAffinity.leading)),
        ],
      ),
    );
  }

  ContentBox optionArtGroup() {
    return ContentBox(
      title: '아트 선택',
      titleBottom: 0,
      children: Column(
        children: [
          AppCheckboxListTitle(
            label: ArtGroupEnum.todayArt.label,
            children: const [
              AppCheckboxListTitle(label: '베이베치크', depthColor: primaryColorOpacity),
              AppCheckboxListTitle(label: '베이베치크', depthColor: primaryColorOpacity),
              AppCheckboxListTitle(label: '베이베치크', price: 45000, depthColor: primaryColorOpacity),
              AppCheckboxListTitle(label: '베이베치크', price: 50000, depthColor: primaryColorOpacity),
              AppCheckboxListTitle(label: '베이베치크', depthColor: primaryColorOpacity),
            ],
          ),
          AppCheckboxListTitle(label: ArtGroupEnum.oneTone.label),
          AppCheckboxListTitle(label: ArtGroupEnum.french.label),
          AppCheckboxListTitle(label: ArtGroupEnum.custom.label),
        ],
      ),
    );
  }

  ContentBox optionTipExtensionGroup() {
    return ContentBox(
      title: '팁 연장',
      children: Column(
        children: [
          AppCheckboxListTitle(label: ArtGroupEnum.oneTone.label),
          AppCheckboxListTitle(label: ArtGroupEnum.oneTone.label),
          AppCheckboxListTitle(label: ArtGroupEnum.oneTone.label),
        ],
      ),
    );
  }
}
