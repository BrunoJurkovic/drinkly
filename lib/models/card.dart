enum CardType {
  regular,
  challenge,
  rule,
  competition,
}

class DrinkCard {
  final CardType type;
  final String text;

  DrinkCard({this.type, this.text});
}
