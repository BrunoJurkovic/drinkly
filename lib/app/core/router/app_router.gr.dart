// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/decks/decks.dart' as _i3;
import 'package:drinkly/players/players.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.PlayerScreen());
    },
    DecksScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.DecksScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PlayerScreenRoute.name, path: '/'),
        _i1.RouteConfig(DecksScreenRoute.name, path: '/decks-screen')
      ];
}

class PlayerScreenRoute extends _i1.PageRouteInfo {
  const PlayerScreenRoute() : super(name, path: '/');

  static const String name = 'PlayerScreenRoute';
}

class DecksScreenRoute extends _i1.PageRouteInfo {
  const DecksScreenRoute() : super(name, path: '/decks-screen');

  static const String name = 'DecksScreenRoute';
}
