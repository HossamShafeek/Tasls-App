import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

final today = DateUtils.dateOnly(DateTime.now());

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.homeRepository) : super(UpdateTaskInitialState());

  final HomeRepository homeRepository;

  static UpdateTaskCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<DateTime?> multiDatePickerValueWithDefaultValue = [
  ];

  int? groupValue=0;

  void changeGroupValue({required int newValue}){
    groupValue = newValue;
    emit(ChangeRadioValueState());
  }

  CreateTaskModel? updateTaskModel;

  Future<void> updateTask({
    int? departmentId,
    required String taskId,
    required String employeeId,
  }) async {
    emit(UpdateTaskLoadingState());
    Either<Failure, CreateTaskModel> result;
    result = await homeRepository.updateTask(
      status: groupValue.toString(),
      taskId: taskId,
      title: titleController.text,
      description: descriptionController.text,
      employeeId: employeeId,
      startDate: DateFormat('yyyy/MM/dd')
          .format(multiDatePickerValueWithDefaultValue[0]!),
      endDate: multiDatePickerValueWithDefaultValue.length == 1
          ? DateFormat('yyyy/MM/dd')
          .format(multiDatePickerValueWithDefaultValue[0]!)
          : DateFormat('yyyy/MM/dd')
          .format(multiDatePickerValueWithDefaultValue[1]!),
    );
    result.fold((failure) {
      print(DateFormat('yyyy/MM/dd')
          .format(multiDatePickerValueWithDefaultValue[0]!));
      emit(UpdateTaskFailureState(failure.error));
      print(failure.error);
    }, (updateTaskModel) {
      this.updateTaskModel = updateTaskModel;
      print(updateTaskModel.message);
      emit(UpdateTaskSuccessState(updateTaskModel));
    });
  }
}
