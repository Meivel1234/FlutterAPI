part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {
  UsersLoadingState({required this.message});
  String message;
  @override
  List<Object> get props => [message];
}

class UsersLoadedState extends UsersState {
  UsersLoadedState({required this.userData});
  RandomUserDataModel userData;
  @override
  List<Object> get props => [userData];
}

class UsersLoadFailedState extends UsersState {
  UsersLoadFailedState({required this.error});
  String error;
  @override
  List<Object> get props => [error];
}
