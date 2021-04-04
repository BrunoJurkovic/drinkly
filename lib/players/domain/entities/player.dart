import 'package:equatable/equatable.dart';

class Player extends Equatable {
  Player({required this.name});
  final String name;

  @override
  List<Object?> get props => [name];
}
