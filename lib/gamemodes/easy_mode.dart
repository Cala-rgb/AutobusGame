import 'dart:convert';
import 'dart:io';

import 'package:autobus_game/shared/deck.dart';
import 'package:autobus_game/shared/textstyles.dart';
import 'package:autobus_game/widgets/card_front.dart';
import 'package:autobus_game/widgets/win_popup.dart';
import 'package:autobus_game/widgets/wrong_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/card_info.dart';
import '../widgets/hero_dialog_route.dart';

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
    //print(_cards);
  }

  int currentState = 0;



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;



    if (imagePaths.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }


    if(currentState == 0) {
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
                SizedBox(height: screenHeight*0.07,),
                Text("Remaining cards: ${52-index}",
                  style: CustomTextStyle.customText4,
                ),
                SizedBox(height: 10,),
                Text("Choose a color!",
                  style: CustomTextStyle.customText4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(height: 10,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardFront(imageURL: imgUrl, CARD_WIDTH: 250, ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getColor() == "red") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Red",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async{
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getColor() == "black") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Black",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          )
      );
    } else if(currentState == 1) {
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
                SizedBox(height: screenHeight*0.07,),
                Text("Remaining cards: ${52-index}",
                  style: CustomTextStyle.customText4,
                ),
                SizedBox(height: 10,),
                Text("Smaller or bigger then ${_cards[index].getActualNumber()<=10? (_cards[index].getNumber()) : ("${_cards[index].getNumber()}/${_cards[index].getActualNumber()}" )}?",
                  style: CustomTextStyle.customText4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(height: 10,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardFront(imageURL: imgUrl, CARD_WIDTH: 250, ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        if(index + 1 <= 52) {
                          if(!_cards[index+1].greaterThen(_cards[index])) {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Smaller",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async{
                        if(index + 1 <= 52) {
                          if(_cards[index+1].greaterThen(_cards[index])) {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Bigger",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          )
      );
    } else if(currentState == 2) {
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
                SizedBox(height: screenHeight*0.07,),
                Text("Remaining cards: ${52-index}",
                  style: CustomTextStyle.customText4,
                ),
                SizedBox(height: 10,),
                Text("Choose a symbol!",
                  style: CustomTextStyle.customText4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(height: 10,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardFront(imageURL: imgUrl, CARD_WIDTH: 250, ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getSymbol() == "hearts") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Hearts♥",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async{
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getSymbol() == "spades") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Spades♠",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getSymbol() == "diamonds") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Diamonds♦",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async{
                        if(index + 1 <= 52) {
                          if(_cards[index+1].getSymbol() == "clubs") {
                            currentState++;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                          } else {
                            currentState = 0;
                            index++;
                            imgUrl = 'assets/cards/${_cards[index].getImgUrl()}';
                            await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return const WrongPopupCard();
                            }));
                          }
                        } else {
                          currentState = 4;
                        }
                        setState(() {

                        });
                      },
                      child: Text("Clubs♣",
                        style: CustomTextStyle.customText4.apply(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          )
      );
    } else {
      return const WinPopupCard();
    }
  }
}
