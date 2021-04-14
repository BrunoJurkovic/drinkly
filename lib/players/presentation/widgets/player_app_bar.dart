import 'package:flutter/material.dart';

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff352f44),
      elevation: 0,
    );
  }
}
