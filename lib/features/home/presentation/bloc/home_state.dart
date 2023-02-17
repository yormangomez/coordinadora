part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final String? message;
  final String? userName;

  const HomeState({
    this.message,
    this.userName,
  });

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class HomeCodeErrorState extends HomeState {
  final String? newMessage;

  const HomeCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [];
}

class UserNameState extends HomeState {
  final String? newUserName;

  const UserNameState({this.newUserName}) : super(userName: newUserName);
  @override
  List<Object?> get props => [];
}
