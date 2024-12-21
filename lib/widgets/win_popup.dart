import 'package:autobus_game/home.dart';
import 'package:autobus_game/shared/textstyles.dart';
import 'package:flutter/material.dart';

import 'hero_dialog_route.dart';

/*class WrongPopup extends StatelessWidget {

  const WrongPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const WrongPopupCard();
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
}*/

/// Tag-value used for the add todo popup button.
const String _heroHowToPlay = 'win-hero';

class WinPopupCard extends StatelessWidget {
  const WinPopupCard({super.key});

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
                    Text("You got off the bus!",
                      style: CustomTextStyle.customText4.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(height: 10,),
                    ),
                    Text("Congrats!",
                      style: CustomTextStyle.customText8.apply(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                      },
                      child: Text("Yay!",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                    )
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



















