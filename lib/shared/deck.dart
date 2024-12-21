import 'package:autobus_game/shared/card_info.dart';

class Deck {

  late List<CardInfo> _cards = [];

  void createDeck(List<String> imagePaths) {
    for(String s in imagePaths) {
      var parts = s.split('/');
      String name = parts[2].split('.')[0];
      var newparts = name.split('_');
      String number = newparts[0];
      String symbol = newparts[2];
      String color = (newparts[2] == "clubs" || newparts[2] == "spades") ? "black" : "red";
      _cards.add(CardInfo(number, symbol, color));
    }
  }

  void randomizeDeck() {
    _cards.shuffle();
  }

  void createRandomDeck(List<String> imagePaths) {
    createDeck(imagePaths);
    randomizeDeck();
  }

  List<CardInfo> getCards() {
    return _cards;
  }

}