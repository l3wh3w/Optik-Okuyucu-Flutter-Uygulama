import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:im_upload/core/constant/static/sayfa_listesi.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required PageController pageController,
    required double currPageValue,
    required this.dotSize,
  })  : pageController = pageController,
        currPageValue = currPageValue;

  final PageController pageController;
  final double currPageValue;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      mainAxisAlignment: MainAxisAlignment.center,
      onTap: (position) {
        pageController.animateToPage(
          position.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      dotsCount: SayfaListesi.stringSayfa.length,
      position: currPageValue,
      decorator: DotsDecorator(
          color: const Color.fromARGB(179, 99, 104, 158),
          activeColor: const Color.fromARGB(179, 81, 72, 140),
          size: Size.square(dotSize),
          activeSize: Size(dotSize * 2.5, dotSize),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          spacing: EdgeInsets.all(dotSize * 3 / 4)),
    );
  }
}
