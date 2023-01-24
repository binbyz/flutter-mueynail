import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/const/value.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  final List<String> images = [
    'https://instagram.ficn1-1.fna.fbcdn.net/v/t51.2885-15/326322123_516453874003974_4072665761195396385_n.jpg?stp=dst-jpg_e35_s150x150&_nc_ht=instagram.ficn1-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=BhzBmLiuSHIAX-5moKR&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAnuMYIOT2zJhuZakUz-6cPNBqCw40yo6amZ8m7uxLv-w&oe=63D3C686&_nc_sid=8fd12b',
    'https://instagram.ficn1-1.fna.fbcdn.net/v/t51.2885-15/326218799_117386811101757_512019014085993456_n.jpg?stp=dst-jpg_e35_s150x150&_nc_ht=instagram.ficn1-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=apc8B2cMf2QAX-INmJD&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDerzj-l9Kry6bIvWfCmQv2EIUuUD7WlnEQnEVfNAfNOA&oe=63D50168&_nc_sid=8fd12b',
    'https://instagram.ficn1-1.fna.fbcdn.net/v/t51.2885-15/326267207_577851247103580_8028090279364022347_n.jpg?stp=dst-jpg_e35_s150x150&_nc_ht=instagram.ficn1-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=aWhtztmKCU4AX-ov_Nk&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfA36KLXjAk5tHV5BTQYQ_uY_P6NkBWzksJAe9cm2TEpPA&oe=63D4ABAB&_nc_sid=8fd12b',
    'https://instagram.ficn1-1.fna.fbcdn.net/v/t51.2885-15/326082546_669756118279722_7564302973831140421_n.jpg?stp=dst-jpg_e35_s150x150&_nc_ht=instagram.ficn1-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=-TJhVtnVHFgAX-eg0y-&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfB1RWcTSxMclPBwJld7iqVE1AJaQNLrUnNKbB0Tdm3R7w&oe=63D3EE26&_nc_sid=8fd12b',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: primaryInvertColor, fontSize: 32.0, fontWeight: FontWeight.w700);

    return SliverAppBar(
      forceElevated: true,
      elevation: 10,
      // shape: const ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(30.0),
      //     bottomRight: Radius.circular(30.0),
      //   ),
      // ),
      backgroundColor: primaryColor,
      expandedHeight: 480,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                const Text(vBrand, style: style),
                const SizedBox(height: 40),
                imageCarousel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageCarousel() {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 300.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
      ),
      itemBuilder: (context, index, realIdx) {
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(images[index], fit: BoxFit.cover, width: 1000),
          ),
        );
      },
    );
  }
}
