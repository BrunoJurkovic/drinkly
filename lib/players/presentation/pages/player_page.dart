import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/player_app_bar.dart';
import '../widgets/player_body.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xff2a2438),
      body: const PlayerBody(),
    );
  }

  /// We have to wrap our custom [AppBar] widget with the
  /// [PreferredSize] because that's what the [appBar:] accepts.
  PreferredSize buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(30.0),
      child: PlayerAppBar(),
    );
  }
}
