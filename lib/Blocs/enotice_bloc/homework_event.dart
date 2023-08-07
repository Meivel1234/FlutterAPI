part of 'homework_bloc.dart';

abstract class HomeworkEvent extends Equatable {
  const HomeworkEvent();

  @override
  List<Object> get props => [];
}

class GetHomeworkEvent extends HomeworkEvent {}

class GetEnoticeEvent extends HomeworkEvent {}
