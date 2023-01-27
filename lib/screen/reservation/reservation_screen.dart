import 'package:flutter/material.dart';
import 'package:mueynail/screen/home/component/content_box.dart';
import 'package:mueynail/screen/home/component/home_app_bar.dart';
import 'package:mueynail/screen/reservation/component/image_radio_item.dart';
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
      print(_selectedDesign);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          ContentBox(
            title: '디자인 선택',
            children: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageRadioItem(design: Design.todayArt, tapCallback: _selectDesign, active: _selectedDesign == Design.todayArt),
                  ImageRadioItem(design: Design.oneTone, tapCallback: _selectDesign, active: _selectedDesign == Design.oneTone),
                  ImageRadioItem(design: Design.french, tapCallback: _selectDesign, active: _selectedDesign == Design.french),
                  ImageRadioItem(design: Design.custom, tapCallback: _selectDesign, active: _selectedDesign == Design.custom),
                ],
              ),
            ),
          ),
          const ReservationButton(),
        ],
      ),
    );
  }
}
