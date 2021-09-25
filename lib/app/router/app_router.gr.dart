// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/decks/domain/entities/deck.dart' as _i7;
import 'package:drinkly/decks/presentation/pages/decks_page.dart' as _i4;
import 'package:drinkly/game/presentation/pages/game_page.dart' as _i5;
import 'package:drinkly/players/presentation/pages/player_page.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerPageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.PlayerPage();
        }),
    DecksPageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.DecksPage();
        }),
    GamePageRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<GamePageRouteArgs>();
          return _i5.GamePage(key: args.key, deck: args.deck);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PlayerPageRoute.name, path: '/'),
        _i1.RouteConfig(DecksPageRoute.name, path: '/decks-page'),
        _i1.RouteConfig(GamePageRoute.name, path: '/game-page')
      ];
}

class PlayerPageRoute extends _i1.PageRouteInfo<void> {
  const PlayerPageRoute() : super(name, path: '/');

  static const String name = 'PlayerPageRoute';
}

class DecksPageRoute extends _i1.PageRouteInfo<void> {
  const DecksPageRoute() : super(name, path: '/decks-page');

  static const String name = 'DecksPageRoute';
}

class GamePageRoute extends _i1.PageRouteInfo<GamePageRouteArgs> {
  GamePageRoute({_i6.Key? key, required _i7.Deck deck})
      : super(name,
            path: '/game-page', args: GamePageRouteArgs(key: key, deck: deck));

  static const String name = 'GamePageRoute';
}

class GamePageRouteArgs {
  const GamePageRouteArgs({this.key, required this.deck});

  final _i6.Key? key;

  final _i7.Deck deck;
}
