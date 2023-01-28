import 'package:flutter/material.dart';
import 'package:mueynail/screen/home/component/content_box.dart';
import 'package:mueynail/screen/home/component/home_app_bar.dart';
import 'package:mueynail/screen/reservation/component/interact_radio_item.dart';
import 'package:mueynail/screen/reservation/component/reservation_button.dart';
import 'package:mueynail/screen/reservation/model/design_enum.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  Design _selectedDesign = Design.todayArt;

  void _selectDesign(Design design) {
    setState(() {
      _selectedDesign = design;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              optionSelectDesign(),
              const ContentBox(
                title: '이달의 아트',
                visibleTitle: false,
                children: Text('이달의 아트 디자인 선택'),
              ),
            ],
          ),
          const ReservationButton(),
        ],
      ),
    );
  }

  ContentBox optionSelectDesign() {
    return ContentBox(
      title: '디자인 선택',
      children: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InteractRadioButton(
                design: Design.todayArt, tapCallback: _selectDesign, active: _selectedDesign == Design.todayArt),
            InteractRadioButton(
                design: Design.oneTone, tapCallback: _selectDesign, active: _selectedDesign == Design.oneTone),
            InteractRadioButton(
                design: Design.french, tapCallback: _selectDesign, active: _selectedDesign == Design.french),
            InteractRadioButton(
                design: Design.custom, tapCallback: _selectDesign, active: _selectedDesign == Design.custom),
          ],
        ),
      ),
    );
  }
}
