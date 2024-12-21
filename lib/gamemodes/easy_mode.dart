import 'dart:convert';
import 'dart:io';

import 'package:autobus_game/shared/deck.dart';
import 'package:autobus_game/shared/textstyles.dart';
import 'package:autobus_game/widgets/card_front.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/card_info.dart';

class EasyMode extends StatefulWidget {
  const EasyMode({super.key});

  @override
  State<EasyMode> createState() => _EasyModeState();
}

class _EasyModeState extends State<EasyMode> {

  List<String> imagePaths = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  int index = 0;

  Deck newDeck = Deck();

  String imgUrl = "assets/card_back_black.png";

  List<CardInfo> _cards = [];

  Future<void> _loadImages() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      imagePaths = manifestMap.keys
          .where((key) => key.startsWith('assets/cards/') && (key.endsWith('.png')))
          .toList();

      setState(() {});
    } catch (e) {
      print('Error loading image paths: $e');
    }

    //imgUrl = 'assets/cards/${testCard.getImgUrl()}';
    newDeck.createRandomDeck(imagePaths);
    _cards = newDeck.getCards();
    print(_cards);
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    if (imagePaths.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }


    print(imgUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Mode",
          style: CustomTextStyle.customText,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.red[100],
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.2,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardFront(imageURL: imgUrl, CARD_WIDTH: 250, ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    imgUrl = 'assets/cards/${_cards[index++].getImgUrl()}';

                  });
                },
                child: Text("Hit")
            )
          ],
        ),
      )
    );
  }
}
