part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  final String? message;

  const GlobalState({
    this.message,
  });

  @override
  List<Object?> get props => [];
}

class GlobalInitial extends GlobalState {}

class GlobalCodeErrorState extends GlobalState {
  final String? newMessage;

  const GlobalCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [];
}
