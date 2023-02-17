part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class UserPageEvent extends HomeEvent {
  UserPageEvent();
  @override
  List<Object?> get props => [];
}

class SolucionEvent extends HomeEvent {
  final String? rastreo;
  final String? fechaR;
  final String? fechaS;
  final String? novedad;
  final String? cliente;
  final String? solucion;

  SolucionEvent({
    this.cliente,
    this.fechaR,
    this.fechaS,
    this.novedad,
    this.rastreo,
    this.solucion,
  });
  @override
  List<Object?> get props => [];
}
