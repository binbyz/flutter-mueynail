import 'package:flutter/material.dart';
import 'package:mueynail/app/components/app_checkbox_list_title.dart';
import 'package:mueynail/app/components/common_app_bar.dart';
import 'package:mueynail/app/enum/art_group_enum.dart';
import 'package:mueynail/app/enum/booking_step_enum.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/screens/reservation/components/booking_date.dart';
import 'package:mueynail/screens/reservation/components/booking_time.dart';

import '../home/components/content_box.dart';
import 'components/reservation_button.dart';

const String iconUrl =
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  BookingStep currentStep = BookingStep.depositConfirmed;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showBookingModal(context, currentStep));

    return Scaffold(
      appBar: const CommonAppBar(title: '예약하기'),
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
      child: SingleChildScrollView(
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
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.spaceBetween,
        children: [
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: true),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
          BookingTime(dateTime: DateTime.now(), checked: false),
        ],
      ),
    );
  }

  ContentBox optionNailPediGroup() {
    return ContentBox(
      title: '네일/패디',
      summary: '필수 선택',
      child: Column(
        children: const [
          AppCheckboxListTitle(label: '네일', affinity: ListTileControlAffinity.leading),
          AppCheckboxListTitle(label: '패디', affinity: ListTileControlAffinity.leading),
        ],
      ),
    );
  }

  ContentBox optionArtGroup() {
    return ContentBox(
      title: '아트 선택',
      summary: '필수 선택',
      titleBottom: 0,
      child: Column(
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
          AppCheckboxListTitle(label: ArtGroupEnum.oneToneArt.label),
          AppCheckboxListTitle(label: ArtGroupEnum.frenchArt.label),
          AppCheckboxListTitle(label: ArtGroupEnum.brandArt.label),
          AppCheckboxListTitle(label: ArtGroupEnum.seasonOffArt.label),
          AppCheckboxListTitle(label: ArtGroupEnum.customArt.label),
        ],
      ),
    );
  }

  ContentBox optionTipExtensionGroup() {
    return ContentBox(
      title: '팁 연장',
      child: Column(
        children: const [
          AppCheckboxListTitle(label: '전체 연장'),
          AppCheckboxListTitle(label: '부분 연장'),
        ],
      ),
    );
  }

  ContentBox optionRemoveNail() {
    return ContentBox(
      title: '제거',
      child: Column(
        children: const [
          AppCheckboxListTitle(label: '자샵 제거'),
          AppCheckboxListTitle(label: '타샵 제거'),
        ],
      ),
    );
  }

  ContentBox optionCare() {
    return ContentBox(
      title: '케어',
      child: Column(
        children: [
          Column(
            children: const [
              AppCheckboxListTitle(label: '네일'),
              AppCheckboxListTitle(label: '패디'),
            ],
          ),
        ],
      ),
    );
  }

  ContentBox optionMemo() {
    return ContentBox(
      title: '기타 요구사항',
      summary: '선택 외 요구사항 입력',
      child: Column(
        children: const [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: primaryColor),
              ),
              hintText: '기타 궁금하신 부분 편하게 남겨주세요 :)',
            ),
          ),
        ],
      ),
    );
  }
}
