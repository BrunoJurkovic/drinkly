import 'package:equatable/equatable.dart';

abstract class Error extends Equatable implements Exception {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class NameError extends Error {}
