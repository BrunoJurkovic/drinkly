import 'package:drinkly/decks/models/card.dart';
import 'package:equatable/equatable.dart';

enum DeckType { standard, mixed }

class Deck extends Equatable {
  const Deck({
    required this.name,
    required this.id,
    required this.cards,
    required this.isOwned,
  });
  final String name;
  final DeckType id;
  final List<DrinkCard> cards;
  final bool isOwned;

  @override
  List<Object?> get props => [name];
}
