import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/RandomUserDataModel.dart';
import '../../services/user_api.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    //get user event
    on<GetUsersDataEvent>((event, emit) async {
      emit(UsersLoadingState(message: " Loding"));
      try {
        var userData = await UserApi.fetchUser();
        if (userData != null) {
          emit(UsersLoadedState(userData: userData));
        } else {
          emit(UsersLoadFailedState(error: "No Data"));
        }
      } catch (e) {
        print(e);
        emit(UsersLoadFailedState(error: "Error"));
      }
    });
  }
}
