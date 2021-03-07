import 'package:auto_route/auto_route.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GameLogic(),
        )
      ],
      child: MaterialApp(
        title: 'Drinkly',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.indigo[900],
          brightness: Brightness.dark,
        ),
        builder: ExtendedNavigator.builder(
          router: MyRouter(),
          initialRoute: Routes.introScreen,
        ),
        onGenerateRoute: MyRouter(),
      ),
    );
  }
}
