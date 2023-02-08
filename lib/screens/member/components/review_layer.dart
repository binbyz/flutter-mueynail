import 'package:flutter/material.dart';
import 'package:mueynail/app/entities/review/review_model.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';

class ReviewLayer extends StatefulWidget {
  final ReviewModel review;

  const ReviewLayer({Key? key, required this.review}) : super(key: key);

  @override
  State<ReviewLayer> createState() => _ReviewLayerState();
}

class _ReviewLayerState extends State<ReviewLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 400,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text('예약일: ${widget.review.createdAt}', style: summaryTextStyle),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(widget.review.artDetail.name, style: titleTextStyle, overflow: TextOverflow.ellipsis),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(child: buildIconButton(Icons.sentiment_dissatisfied_rounded, 0)),
                    Expanded(child: buildIconButton(Icons.sentiment_neutral_rounded, 1)),
                    Expanded(child: buildIconButton(Icons.sentiment_satisfied_alt_rounded, 2)),
                  ],
                ),
              ),
              buildTextField(),
            ],
          ),
          Positioned(left: 0, bottom: 30, child: buildBottomSaveButton(context)),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, int point) {
    return SizedBox(
      width: 80,
      height: 80,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, size: 60, color: point == 2 ? primaryColor : Colors.black26),
        tooltip: 'test',
      ),
    );
  }

  TextField buildTextField() {
    return const TextField(
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
        hintText: '(선택 입력)',
      ),
    );
  }

  Widget buildBottomSaveButton(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width - 30,
      child: ElevatedButton(onPressed: () {}, child: const Text('후기 저장')),
    );
  }
}
