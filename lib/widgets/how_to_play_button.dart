import 'package:autobus_game/shared/textstyles.dart';
import 'package:flutter/material.dart';

import 'hero_dialog_route.dart';

class HowToPlayButton extends StatelessWidget {

  const HowToPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _HowToPlayPopupCard();
          }));
        },
        child: Hero(
          tag: _heroHowToPlay,
          createRectTween: (begin, end) {
            return RectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.red[600],
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "How to play?",
                style: CustomTextStyle.customText4.apply(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroHowToPlay = 'how-to-play-hero';

class _HowToPlayPopupCard extends StatelessWidget {
  const _HowToPlayPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroHowToPlay,
          createRectTween: (begin, end) {
            return RectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.red[600],
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("When you start playing you are in the bus, to get out and finish the game you have to guess a series of cards explained below, if you get one wrong you must take a forfeit and start from the beginning",
                    style: CustomTextStyle.customText5.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Text("Easy Mode",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("- Color(Red or Black)",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Bigger or smaller the previous",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Symbol",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Text("Hard Mode",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("- Color(Red or Black)",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Bigger or smaller the previous",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Bigger, smaller or between the previous 2",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Symbol",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Text("Extreme Mode",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Divider(thickness: 2,height: 10,color: Colors.black54,),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("- Color(Red or Black)",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Bigger or smaller the previous",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Bigger, smaller or between the previous 2",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- Symbol",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                          Text("- The deck resets after every attempt, whereas on the other ones you can get of the bus if the deck finishes",
                            style: CustomTextStyle.customText9,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}