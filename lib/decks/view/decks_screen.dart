import 'package:drinkly/app/injection_container.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DecksBloc>(),
      child: DecksView(),
    );
  }
}

class DecksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
