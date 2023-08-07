import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc() : super(CreateUserInitial()) {
    on<CreateUserEvent>((event, emit) {});
  }
}
