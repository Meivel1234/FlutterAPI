part of 'create_user_bloc.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class UserFormState extends CreateUserState {}

class UserSubmitState extends CreateUserState {}
