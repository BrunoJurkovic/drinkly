// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DrinklyLogo extends StatelessWidget {
  const DrinklyLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.35,
      decoration: const BoxDecoration(
        color: Color(0xff352f44),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
      ),
      child: buildImage(height, width),
    );
  }

  Center buildImage(double height, double width) {
    return Center(
      child: SizedBox(
        height: height * 0.27,
        width: width * 0.7,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
