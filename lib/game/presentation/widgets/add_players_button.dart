import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import '../pages/game_page.dart';

class AddPlayerSheetButton extends StatelessWidget {
  const AddPlayerSheetButton({
    Key? key,
    required this.controller,
    required this.frontCardIndex,
  }) : super(key: key);

  final TCardController controller;
  final int frontCardIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, height * 0.15, 0, 0),
      child: IconButton(
        iconSize: height * 0.045,
        icon: const Icon(CupertinoIcons.person_add_solid),
        onPressed: () async {
          buildModalBottomSheet(context, height, controller);
        },
      ),
    );
  }
}
