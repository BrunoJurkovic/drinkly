// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/decks/decks.dart';
import '../screens/intro/intro.dart';

class Routes {
  static const String introScreen = '/';
  static const String decksScreen = '/decks-screen';
  static const all = <String>{
    introScreen,
    decksScreen,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.introScreen, page: IntroScreen),
    RouteDef(Routes.decksScreen, page: DecksScreen),
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
  };
}
