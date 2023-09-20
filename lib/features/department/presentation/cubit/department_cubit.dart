import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit(this.departmentRepository) : super(DepartmentInitialState());
  final DepartmentRepository departmentRepository;

  static DepartmentCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameControllerForCreate = TextEditingController();
  final TextEditingController nameControllerForUpdate = TextEditingController();

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

  DepartmentsModel? departmentsModel;

  Future<void> getAllDepartment() async {
    emit(GetAllDepartmentsLoadingState());
    Either<Failure, DepartmentsModel> result;
    result = await departmentRepository.getAllDepartments();
    result.fold((failure) {
      emit(GetAllDepartmentsFailureState(failure.error));
    }, (departmentsModel) {
      this.departmentsModel = departmentsModel;
      emit(GetAllDepartmentsSuccessState(departmentsModel));
    });
  }

  CreateDepartmentModel? updateDepartmentModel;

  Future<void> updateDepartment({
    required int departmentId,
    required String managerId,
    required name,
  }) async {
    emit(UpdateDepartmentsLoadingState());
    Either<Failure, CreateDepartmentModel> result;
    result = await departmentRepository.updateDepartment(
        name: name, departmentId: departmentId, managerId: managerId);
    result.fold((failure) {
      emit(UpdateDepartmentsFailureState(failure.error));
      print(failure.error.toString());
    }, (updateDepartmentModel) {
      this.updateDepartmentModel = updateDepartmentModel;
      print('================================');
      print(updateDepartmentModel.message);
      print('================================');
      emit(UpdateDepartmentsSuccessState(updateDepartmentModel));
    });
  }

  void updateDepartment2({
    required int departmentId,
    required int managerId,
    required name,
  }) {
    emit(UpdateDepartmentsLoadingState());
    departmentRepository
        .updateDepartment2(
      departmentId: departmentId,
      name: name,
      managerId: managerId,
    )
        .then((value) {
      emit(UpdateDepartmentsSuccessState(value));
    }).catchError((error) {
      emit(UpdateDepartmentsFailureState(error.toString()));
      print(error.toString());
    });
  }
}
