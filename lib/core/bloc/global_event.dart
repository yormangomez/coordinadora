part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class UserEvent extends GlobalEvent {
  final String idUser;

  const UserEvent({required this.idUser});
}
