part of 'onbording_bloc.dart';

abstract class OnbordingEvent extends Equatable {
  const OnbordingEvent();

  @override
  List<Object?> get props => [];
}

class TrackingEvent extends OnbordingEvent {
  const TrackingEvent();

  @override
  List<Object?> get props => [];
}

class TrackingSeachEvent extends OnbordingEvent {
  final String document;

  const TrackingSeachEvent({required this.document});

  @override
  List<Object?> get props => [document];
}
