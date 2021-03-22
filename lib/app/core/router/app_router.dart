import 'package:auto_route/annotations.dart';

import '../../../counter/counter.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(
      page: CounterPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
