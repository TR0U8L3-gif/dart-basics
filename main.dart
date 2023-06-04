int main(){
 	Deck deck = Deck();
  return 0; 
}

class Deck {
  List<Card> cards = [];

  Deck(){
    List<Card> cards = [];
    var ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'];
  	var suits = ['D', 'H', 'C', 'S'];
  
  	for(var rank in ranks){
      for(var suit in suits){
        Card card = Card(rank: rank, suit: suit);
      	cards.add(card);
      }
    }
    cards.shuffle();
    this.cards = cards;
  }
}

class Card {
  String suit;
  String rank;

  Card({required this.suit, required this.rank});
}