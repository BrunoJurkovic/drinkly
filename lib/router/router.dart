import 'package:auto_route/auto_route_annotations.dart';
import 'package:drinkly/screens/decks/decks.dart';
import 'package:drinkly/screens/game/game.dart';
import 'package:drinkly/screens/intro/intro.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: IntroScreen),
  AdaptiveRoute(page: DecksScreen),
  AdaptiveRoute(page: GameScreen),
])
class $MyRouter {}
