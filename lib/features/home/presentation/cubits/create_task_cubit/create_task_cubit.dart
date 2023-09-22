import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_state.dart';

final today = DateUtils.dateOnly(DateTime.now());

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit(this.homeRepository) : super(CreateTaskInitialState());

  final HomeRepository homeRepository;

  static CreateTaskCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<DateTime?> multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, today.day),
  ];

  String? dropdownValue;

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
      emit(CreateTaskFailureState(failure.error));
      print(failure.error);
    }, (createTaskModel) {
      this.createTaskModel = createTaskModel;
      print(createTaskModel.message);
      emit(CreateTaskSuccessState(createTaskModel));
    });
  }
}
