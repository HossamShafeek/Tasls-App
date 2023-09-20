import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_state.dart';

final today = DateUtils.dateOnly(DateTime.now());

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.homeRepository) : super(TaskInitialState());

  final HomeRepository homeRepository;

  static TaskCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  List<DateTime?> multiDatePickerValueWithDefaultValue = [
    DateTime(today
        .year,today
        .month, today
        .day),
  ];

  String? dropdownValue;

  void changeDropdownValue({required dynamic value}) {
    dropdownValue = value.id.toString();
    emit(ChangeDropdownValueState());
  }

  CreateTaskModel? createTaskModel;

  Future<void> createTask({
    int? departmentId,
  }) async {
    emit(CreateTaskLoadingState());
    Either<Failure, CreateTaskModel> result;
    result = await homeRepository.createTask(
      title: titleController.text,
      description: descriptionController.text,
      employeeId: dropdownValue!,
      startDate: multiDatePickerValueWithDefaultValue[0]!,
      endDate: multiDatePickerValueWithDefaultValue[1]??multiDatePickerValueWithDefaultValue[0]!,
    );
    result.fold((failure) {
      emit(CreateTaskFailureState(failure.error));
      print(failure.error);
    }, (createTaskModel) {
      this.createTaskModel = createTaskModel;
      print(createTaskModel.message);
      emit(CreateTaskSuccessState(createTaskModel));
    });
  }
}
