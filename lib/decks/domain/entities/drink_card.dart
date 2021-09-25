// 📦 Package imports:
import 'package:equatable/equatable.dart';

enum CardType {
  regular,
  challenge,
  rule,
  competition,
}

class DrinkCard extends Equatable {
  const DrinkCard({required this.type, required this.text});
  final CardType type;
  final String text;

  @override
  List<Object?> get props => [type, text];
}
