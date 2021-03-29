// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:drinkly/app/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:drinkly/app/app.dart';
import 'package:drinkly/app/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () {
      initGetIt();
      runApp(App());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
