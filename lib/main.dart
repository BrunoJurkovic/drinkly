import 'package:auto_route/auto_route.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GameLogic(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Drinkly',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.indigo[900],
          brightness: Brightness.dark,
        ),
        builder: ExtendedNavigator.builder(
            router: MyRouter(),
            initialRoute: Routes.introScreen,
            observers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ]),
        onGenerateRoute: MyRouter(),
      ),
    );
  }
}
