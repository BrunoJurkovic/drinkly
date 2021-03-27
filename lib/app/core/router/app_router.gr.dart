// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/decks/decks.dart' as _i3;
import 'package:drinkly/game/view/games_screen.dart' as _i4;
import 'package:drinkly/players/players.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.PlayerScreen());
    },
    DecksScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.DecksScreen());
    },
    GamesScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<GamesScreenRouteArgs>();
      return _i1.AdaptivePage(
          entry: entry, child: _i4.GamesScreen(key: args.key, deck: args.deck));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PlayerScreenRoute.name, path: '/'),
        _i1.RouteConfig(DecksScreenRoute.name, path: '/decks-screen'),
        _i1.RouteConfig(GamesScreenRoute.name, path: '/games-screen')
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

class GamesScreenRoute extends _i1.PageRouteInfo<GamesScreenRouteArgs> {
  GamesScreenRoute({_i5.Key? key, required _i3.DeckType deck})
      : super(name,
            path: '/games-screen',
            args: GamesScreenRouteArgs(key: key, deck: deck));

  static const String name = 'GamesScreenRoute';
}

class GamesScreenRouteArgs {
  const GamesScreenRouteArgs({this.key, required this.deck});

  final _i5.Key? key;

  final _i3.DeckType deck;
}
