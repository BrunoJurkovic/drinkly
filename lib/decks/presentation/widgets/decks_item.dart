import 'package:flutter/material.dart';

class DeckItem extends StatelessWidget {
  const DeckItem({Key? key, required this.imageUri, required this.callback})
      : super(key: key);

  final String imageUri;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      // ignore: unnecessary_lambdas
      onTap: () => callback(),
      child: buildImageContainer(height, width),
    );
  }

  SizedBox buildImageContainer(double height, double width) {
    return SizedBox(
      height: height * 0.125,
      width: width * 0.8,
      child: Image.asset(imageUri),
    );
  }
}
