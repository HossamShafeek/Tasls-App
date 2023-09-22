import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/tasks_model/tasks_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';
import 'package:tasks_app/features/home/presentation/cubits/tasks_cubit/tasks_state.dart';

class GetAllTasksCubit extends Cubit<GetAllTasksState> {
  GetAllTasksCubit(this.homeRepository)
      : super(GetAllTasksInitialState());
  final HomeRepository homeRepository;

  static GetAllTasksCubit get(context) => BlocProvider.of(context);

  TasksModel? tasksModel;

  Future<void> getAllTasks() async {
    emit(GetAllTasksLoadingState());
    Either<Failure, TasksModel> result;
    result = await homeRepository.getAllTasks();
    result.fold((failure) {
      emit(GetAllTasksFailureState(failure.error));
    }, (tasksModel) {
      this.tasksModel = tasksModel;
      emit(GetAllTasksSuccessState(tasksModel));
    });
  }


}
