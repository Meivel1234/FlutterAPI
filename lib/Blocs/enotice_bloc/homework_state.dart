part of 'homework_bloc.dart';

abstract class HomeworkState extends Equatable {
  const HomeworkState();

  @override
  List<Object> get props => [];
}

class HomeworkInitial extends HomeworkState {}

class EnoticeLoadingState extends HomeworkState {
  EnoticeLoadingState({required this.message});
  String message;
  @override
  List<Object> get props => [message];
}

class EnoticeLoadedState extends HomeworkState {
  EnoticeLoadedState({required this.enoticeData});
  List<EnoticeDatum> enoticeData;
  @override
  List<Object> get props => [enoticeData];
}

class EnoticeFailedState extends HomeworkState {
  EnoticeFailedState({required this.error});
  String error;
  @override
  List<Object> get props => [error];
}

//homework
class HomeworkLoadingState extends HomeworkState {
  HomeworkLoadingState({required this.message});
  String message;
  @override
  List<Object> get props => [message];
}

class HomeworkLoadedState extends HomeworkState {
  HomeworkLoadedState({required this.hwData});
  List<HomeworkDatum> hwData;
  @override
  List<Object> get props => [hwData];
}

class HomeworkFailedState extends HomeworkState {
  HomeworkFailedState({required this.error});
  String error;
  @override
  List<Object> get props => [error];
}
