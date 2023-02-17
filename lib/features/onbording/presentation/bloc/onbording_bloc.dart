import 'package:coordinadora_test/features/onbording/data/model/tracking_model.dart';
import 'package:coordinadora_test/features/onbording/domain/usecases/document_usecases.dart';
import 'package:coordinadora_test/features/onbording/domain/usecases/tracking_usecases.dart';
import 'package:coordinadora_test/navigator.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onbording_event.dart';
part 'onbording_state.dart';

class OnbordingBloc extends Bloc<OnbordingEvent, OnbordingState> {
  final TrackingUseCases trackingUseCases;
  final DocumentUseCases documentUseCases;

  OnbordingBloc({
    required this.trackingUseCases,
    required this.documentUseCases,
  }) : super(OnbordingInitial()) {
    on<OnbordingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<TrackingEvent>((event, emit) async {
      final resultDb = await trackingUseCases.repository.getTracking();
      final result = await documentUseCases.repository.getDocument();

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(HomeCodeErrorState(newMessage: message));
      }, (List<TrackingModel> tracking) {
        List documentList = [];
        result.fold((dynamic failure) {
          String message = failure.message;
          emit(HomeCodeErrorState(newMessage: message));
        }, (List docuemnt) {
          documentList = docuemnt;
          print(documentList);
        });
        emit(TrackingState(
            newDocumentList: documentList, newTrackingList: tracking));
      });
    });

    on<TrackingSeachEvent>((event, emit) async {
      final resultDb = await trackingUseCases.repository.getTracking();
      final result = await documentUseCases.repository.getDocument();

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(HomeCodeErrorState(newMessage: message));
      }, (List<TrackingModel> tracking) {
        List documentList = [];
        result.fold((dynamic failure) {
          String message = failure.message;
          emit(HomeCodeErrorState(newMessage: message));
        }, (List docuemnt) {
          documentList = docuemnt;
        });

        for (var i = 0; i < documentList.length; i++) {
          if (documentList[i] == event.document) {
            emit(
              TrackingSeachState(
                newTracking: tracking[i],
                newDocumento: documentList[i],
              ),
            );
            AppNavigator.push(Routes.HOME);
          }
        }
      });
    });
  }
}
