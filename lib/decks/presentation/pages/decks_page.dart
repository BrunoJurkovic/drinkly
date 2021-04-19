import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/dependency_injection.dart';
import '../bloc/decks_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/item.dart';

class DecksPage extends StatelessWidget {
  const DecksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DecksAppBar(),
      ),
      body: BlocProvider(
        create: (context) => sl<DecksBloc>(),
        child: const DeckPageBody(),
      ),
      backgroundColor: const Color(0xff2a2438),
    );
  }
}
