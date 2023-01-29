import 'package:flutter/material.dart';
import 'package:mueynail/app/components/app_checkbox_list_title.dart';
import 'package:mueynail/app/enum/art_group_enum.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/screens/reservation/components/booking_date.dart';

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
          Container(
            padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 80),
            child: ListView(
              children: [
                optionBookingDate(),
                optionBookingTime(),
                optionNailPediGroup(),
                optionRemoveNail(),
                optionArtGroup(),
                optionTipExtensionGroup(),
                optionCare(),
                optionMemo(),
              ],
            ),
          ),
          const ReservationButton(),
        ],
      ),
    );
  }

  ContentBox optionBookingDate() {
    return ContentBox(
      title: '예약 날짜',
      summary: '스케쥴에 따라 시간은 조율될 수 있습니다',
      children: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: true),
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: false),
              BookingDate(dateTime: DateTime.now(), checked: false),
            ],
          ),
        ),
      ),
    );
  }

  ContentBox optionBookingTime() {
    return ContentBox(
      title: '예약 시간',
      summary: '스케쥴에 따라 시간은 조율될 수 있습니다',
      visibleTitle: false,
      children: Wrap(
        children: [
          
        ],
      ),
    );
  }

  ContentBox optionNailPediGroup() {
    return ContentBox(
      title: '네일/패디',
      summary: '필수 선택',
      children: Row(
        children: const [
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '네일', affinity: ListTileControlAffinity.leading)),
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '패디', affinity: ListTileControlAffinity.leading)),
        ],
      ),
    );
  }

  ContentBox optionArtGroup() {
    return ContentBox(
      title: '아트 선택',
      summary: '필수 선택',
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
      children: Row(
        children: const [
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '전체 연장')),
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '부분 연장')),
        ],
      ),
    );
  }

  ContentBox optionRemoveNail() {
    return ContentBox(
      title: '제거',
      children: Row(
        children: const [
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '자샵 제거')),
          Expanded(flex: 1, child: AppCheckboxListTitle(label: '타샵 제거')),
        ],
      ),
    );
  }

  ContentBox optionCare() {
    return ContentBox(
      title: '케어',
      children: Column(
        children: [
          Row(
            children: const [
              Expanded(flex: 1, child: AppCheckboxListTitle(label: '네일')),
              Expanded(flex: 1, child: AppCheckboxListTitle(label: '패디')),
            ],
          ),
          const AppCheckboxListTitle(label: '발각질 관리'),
        ],
      ),
    );
  }

  ContentBox optionMemo() {
    return ContentBox(
      title: '기타 요구사항',
      summary: '선택 외 요구사항 입력',
      children: Column(
        children: const [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
