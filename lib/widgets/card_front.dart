import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  CardFront({super.key, required this.imageURL, required this.CARD_WIDTH});

  String imageURL;

  double CARD_WIDTH;

  static const double _RATIO = 1.45;



  @override
  Widget build(BuildContext context) {
    double CARD_HEIGHT = CARD_WIDTH*_RATIO;
    print(imageURL);
    return Container(
      width: CARD_WIDTH,
      height: CARD_HEIGHT,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imageURL,),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
