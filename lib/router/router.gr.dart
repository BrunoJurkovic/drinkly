// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../screens/decks/decks.dart';
import '../screens/game/game.dart';
import '../screens/intro/intro.dart';

class Routes {
  static const String introScreen = '/intro-screen';
  static const String decksScreen = '/decks-screen';
  static const String gameScreen = '/game-screen';
  static const all = <String>{
    introScreen,
    decksScreen,
    gameScreen,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.introScreen, page: IntroScreen),
    RouteDef(Routes.decksScreen, page: DecksScreen),
    RouteDef(Routes.gameScreen, page: GameScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IntroScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => IntroScreen(),
        settings: data,
      );
    },
    DecksScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DecksScreen(),
        settings: data,
      );
    },
    GameScreen: (data) {
      final args = data.getArgs<GameScreenArguments>(
        orElse: () => GameScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => GameScreen(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// GameScreen arguments holder class
class GameScreenArguments {
  final Key key;
  final String id;
  GameScreenArguments({this.key, this.id});
}
