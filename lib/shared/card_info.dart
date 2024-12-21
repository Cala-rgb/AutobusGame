class CardInfo {

  late String _number;
  late String _symbol,_color;

  CardInfo(String nr, String symb, String color) {
    this._number = nr;
    this._symbol = symb;
    this._color = color;
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

}