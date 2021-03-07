import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:drinkly/screens/decks/decks.dart';
import 'package:drinkly/screens/intro/intro.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: IntroScreen, initial: true),
  AdaptiveRoute(page: DecksScreen)
])
class $MyRouter {}
