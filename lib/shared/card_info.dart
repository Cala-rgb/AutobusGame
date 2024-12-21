class CardInfo {

  late String _number;
  late String _symbol,_color;

  late int _actualNumber;

  CardInfo(String nr, String symb, String color) {
    this._number = nr;
    this._symbol = symb;
    this._color = color;
    if(_number == "king") {
      this._actualNumber = 13;
    } else if(_number == "queen") {
      this._actualNumber = 12;
    } else if(_number == "jack") {
      this._actualNumber = 11;
    } else if(_number == "ace") {
      this._actualNumber = 14;
    } else {
      this._actualNumber = int.parse(_number);
    }
  }

  String getNumber() {
    return this._number;
  }

  String getColor() {
    return this._color;
  }

  String getSymbol() {
    return this._symbol;
  }

  String getImgUrl() {
    return _number+"_of_"+_symbol+".png";
  }

  int getActualNumber() {
    return this._actualNumber;
  }

  bool greaterThen(CardInfo card) {
      return this._actualNumber >= card.getActualNumber() ? true : false;
  }

  bool lessThen(CardInfo card) {
    return this._actualNumber <= card.getActualNumber() ? true : false;
  }

}