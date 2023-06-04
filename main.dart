int main(){
 	Deck deck = Deck();
  print(deck);
  deck.shuffle();
  print(deck);
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

  void shuffle(){
    cards.shuffle();
  }

  @override
  String toString() {
    String result = "";
    for(int i = 0; i < cards.length; i++){
      result += "card[$i]: ${cards[i]}\n";
    }
    return result;
  }
}

class Card {
  String suit;
  String rank;

  Card({required this.suit, required this.rank});

  @override
  String toString() {
    return "$suit $rank";
  }
}