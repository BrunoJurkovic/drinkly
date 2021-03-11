import 'package:auto_route/auto_route.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:drinkly/services/shared_prefs.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirstRun = await SharedPreferencesService.isFirstTimeRun();

  if (isFirstRun) {
    runApp(MyApp(
      isFirstRun: true,
    ));
  } else {
    runApp(MyApp(
      isFirstRun: false,
    ));
  }
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final bool isFirstRun;

  MyApp({Key key, this.isFirstRun}) : super(key: key);
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
            initialRoute:
                isFirstRun ? Routes.onboardingScreen : Routes.introScreen,
            observers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ]),
        onGenerateRoute: MyRouter(),
      ),
    );
  }
}
