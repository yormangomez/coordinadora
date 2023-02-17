part of 'onbording_bloc.dart';

abstract class OnbordingState extends Equatable {
  final String? message;
  final List? documentList;
  final List<TrackingModel>? trackingList;
  final TrackingModel? tracking;
  final String? documento;

  bool isTracking;

  OnbordingState({
    this.message,
    this.documentList,
    this.trackingList,
    this.tracking,
    this.documento,
    this.isTracking = false,
  });

  @override
  List<Object?> get props => [message];
}

class OnbordingInitial extends OnbordingState {}

class HomeCodeErrorState extends OnbordingState {
  final String? newMessage;

  HomeCodeErrorState({this.newMessage}) : super(message: newMessage);

  @override
  List<Object?> get props => [newMessage];
}

class TrackingState extends OnbordingState {
  final List? newDocumentList;
  final List<TrackingModel>? newTrackingList;
  TrackingState({this.newTrackingList, this.newDocumentList})
      : super(
          documentList: newDocumentList,
          trackingList: newTrackingList,
        );

  @override
  List<Object?> get props => [newDocumentList, newTrackingList];
}

class TrackingSeachState extends OnbordingState {
  final TrackingModel? newTracking;
  final String? newDocumento;

  TrackingSeachState({this.newTracking, this.newDocumento})
      : super(
          tracking: newTracking,
          documento: newDocumento,
        );

  @override
  List<Object?> get props => [newTracking];
}
