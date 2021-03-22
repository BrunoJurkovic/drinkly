// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/players/players.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.PlayerScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(PlayerScreenRoute.name, path: '/')];
}

class PlayerScreenRoute extends _i1.PageRouteInfo {
  const PlayerScreenRoute() : super(name, path: '/');

  static const String name = 'PlayerScreenRoute';
}
