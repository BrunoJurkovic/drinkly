import 'package:auto_route/auto_route.dart';
import 'package:drinkly/app/app.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: TempScreen, initial: true),
  ],
)
class $AppRouter {}
