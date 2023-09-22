import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';
import 'package:tasks_app/features/department/presentation/cubits/create_department_cubit/create_department_state.dart';

class CreateDepartmentCubit extends Cubit<CreateDepartmentState> {
  CreateDepartmentCubit(this.departmentRepository)
      : super(CreateDepartmentInitialState());
  final DepartmentRepository departmentRepository;

  static CreateDepartmentCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameControllerForCreate = TextEditingController();

  var formKeyForCreate = GlobalKey<FormState>();
  var formKeyForUpdate = GlobalKey<FormState>();

  CreateDepartmentModel? departmentModel;

  Future<void> createDepartment() async {
    emit(CreateDepartmentLoadingState());
    Either<Failure, CreateDepartmentModel> result;
    result = await departmentRepository.createDepartment(
        name: nameControllerForCreate.text);
    result.fold((failure) {
      emit(CreateDepartmentFailureState(failure.error));
    }, (departmentModel) {
      this.departmentModel = departmentModel;
      emit(CreateDepartmentSuccessState(departmentModel));
    });
  }
}
