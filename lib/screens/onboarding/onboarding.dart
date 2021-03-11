import 'package:auto_route/auto_route.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:drinkly/services/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: true,
        next: const Icon(CupertinoIcons.forward),
        curve: Curves.easeInCubic,
        onDone: () async {
          await SharedPreferencesService.setFirstTimeRun();
          ExtendedNavigator.root.popAndPush(Routes.introScreen);
        },
        done: Icon(CupertinoIcons.check_mark),
        pages: [
          PageViewModel(
            title: 'Drinkly',
            body:
                'Welcome to drinkly! \n Add the players, and drink on! \n Please drink responsibly! We are not responsible for any accidents.',
            image: Image.asset('assets/images/1.png'),
            decoration: const PageDecoration(
              pageColor: Color(0xff352f44),
            ),
          ),
          PageViewModel(
            title: 'How to play?',
            body:
                'Drinkly is meant to be simple. \n To start a game, follow these steps: \n 1. Add the players. \n 2. Click the start button and select a pack. \n 3. Click on a card to flip it, and swipe to go to the next one.',
            image: Image.asset('assets/images/2.png'),
            decoration: const PageDecoration(
              pageColor: Color(0xff352f44),
            ),
          ),
          PageViewModel(
            title: 'Rules',
            body:
                'There are two ways to play; \n 1. One player is the game master, and reads the cards to the players, they can choose if they want to play or not. \n 2. You pass the phone around the room and each player reads their card. \n We recommend the first way for the best experience!',
            image: Image.asset('assets/images/3.png'),
            decoration: const PageDecoration(
              pageColor: Color(0xff352f44),
            ),
          ),
        ],
      ),
    );
  }
}
