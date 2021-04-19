// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/decks/domain/entities/deck.dart' as _i6;
import 'package:drinkly/decks/presentation/pages/decks_page.dart' as _i3;
import 'package:drinkly/game/presentation/pages/game_page.dart' as _i4;
import 'package:drinkly/players/presentation/pages/player_page.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerPageRoute.name: (entry) {
      // ignore: prefer_const_constructors
      return _i1.AdaptivePage(entry: entry, child: _i2.PlayerPage());
    },
    DecksPageRoute.name: (entry) {
      // ignore: prefer_const_constructors
      return _i1.AdaptivePage(entry: entry, child: _i3.DecksPage());
    },
    GamePageRoute.name: (entry) {
      var args = entry.routeData.argsAs<GamePageRouteArgs>();
      return _i1.AdaptivePage(
          entry: entry, child: _i4.GamePage(key: args.key, deck: args.deck));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PlayerPageRoute.name, path: '/'),
        _i1.RouteConfig(DecksPageRoute.name, path: '/decks-page'),
        _i1.RouteConfig(GamePageRoute.name, path: '/game-page')
      ];
}

class PlayerPageRoute extends _i1.PageRouteInfo {
  const PlayerPageRoute() : super(name, path: '/');

  static const String name = 'PlayerPageRoute';
}

class DecksPageRoute extends _i1.PageRouteInfo {
  const DecksPageRoute() : super(name, path: '/decks-page');

  static const String name = 'DecksPageRoute';
}

class GamePageRoute extends _i1.PageRouteInfo<GamePageRouteArgs> {
  GamePageRoute({_i5.Key? key, required _i6.Deck deck})
      : super(name,
            path: '/game-page', args: GamePageRouteArgs(key: key, deck: deck));

  static const String name = 'GamePageRoute';
}

class GamePageRouteArgs {
  const GamePageRouteArgs({this.key, required this.deck});

  final _i5.Key? key;

  final _i6.Deck deck;
}
