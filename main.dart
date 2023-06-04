int main(){
 	Deck deck = Deck();
  return 0; 
}

class Deck {
  List<Card> cards = [];
}

class Card {
  String suit;
  String rank;
}