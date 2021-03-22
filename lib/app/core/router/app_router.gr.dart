// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:drinkly/counter/counter.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    CounterPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: const _i2.CounterPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(CounterPageRoute.name, path: '/')];
}

class CounterPageRoute extends _i1.PageRouteInfo {
  const CounterPageRoute() : super(name, path: '/');

  static const String name = 'CounterPageRoute';
}
