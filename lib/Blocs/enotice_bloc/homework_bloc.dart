import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_2/services/user_api.dart';

import '../../model/EnoticeDataModel.dart';
import '../../model/HomeworkDataModel.dart';

part 'homework_event.dart';
part 'homework_state.dart';

class HomeworkBloc extends Bloc<HomeworkEvent, HomeworkState> {
  HomeworkBloc() : super(HomeworkInitial()) {
    on<GetEnoticeEvent>((event, emit) async {
      emit(EnoticeLoadingState(message: 'loading'));
      try {
        List<EnoticeDatum> enoticeData = await UserApi.fetchEnotice();
        if (enoticeData.isNotEmpty) {
          emit(EnoticeLoadedState(enoticeData: enoticeData));
        } else {
          emit(EnoticeFailedState(error: 'No Data'));
        }
      } catch (e) {
        print(e);
        emit(EnoticeFailedState(error: 'Error'));
      }
    });

    on<GetHomeworkEvent>((event, emit) async {
      emit(HomeworkLoadingState(message: 'loading'));
      try {
        List<HomeworkDatum> hwData = await UserApi.fetchHomework();
        if (hwData.isNotEmpty) {
          emit(HomeworkLoadedState(hwData: hwData));
        } else {
          emit(HomeworkFailedState(error: 'No Data'));
        }
      } catch (e) {
        print(e);
        emit(HomeworkFailedState(error: 'Error'));
      }
    });
  }
}
