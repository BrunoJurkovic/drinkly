// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/app/app.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    TempScreenRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.TempScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(TempScreenRoute.name, path: '/')];
}

class TempScreenRoute extends _i1.PageRouteInfo {
  const TempScreenRoute() : super(name, path: '/');

  static const String name = 'TempScreenRoute';
}
