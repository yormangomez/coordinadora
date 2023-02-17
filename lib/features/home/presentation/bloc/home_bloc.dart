import 'package:coordinadora_test/features/home/domain/usecases/home_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCases;

  HomeBloc({required this.homeUseCases}) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<UserPageEvent>((event, emit) async {});
    on<SolucionEvent>((event, emit) async {
      final data = {
        "novedad": event.novedad,
        "fecha_reporte": event.fechaR,
        "fecha_solucion": event.fechaS,
        "solucion": event.solucion,
        "guia": event.rastreo,
        "cliente": event.cliente,
      };
      await homeUseCases.repository.postUser(data);
    });
  }
}
