// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/players/presentation/pages/player_page.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PlayerPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.PlayerPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(PlayerPageRoute.name, path: '/')];
}

class PlayerPageRoute extends _i1.PageRouteInfo {
  const PlayerPageRoute() : super(name, path: '/');

  static const String name = 'PlayerPageRoute';
}
