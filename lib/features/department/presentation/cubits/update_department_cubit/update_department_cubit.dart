import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';
import 'package:tasks_app/features/department/presentation/cubits/update_department_cubit/update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  UpdateDepartmentCubit(this.departmentRepository)
      : super((UpdateDepartmentInitialState()));
  final DepartmentRepository departmentRepository;

  static UpdateDepartmentCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameControllerForUpdate = TextEditingController();

  var formKeyForCreate = GlobalKey<FormState>();
  var formKeyForUpdate = GlobalKey<FormState>();

  CreateDepartmentModel? updateDepartmentModel;

  Future<void> updateDepartment({
    required int departmentId,
    required String managerId,
    required name,
  }) async {
    emit(UpdateDepartmentLoadingState());
    Either<Failure, CreateDepartmentModel> result;
    result = await departmentRepository.updateDepartment(
        name: name, departmentId: departmentId, managerId: managerId);
    result.fold((failure) {
      emit(UpdateDepartmentFailureState(failure.error));
    }, (updateDepartmentModel) {
      this.updateDepartmentModel = updateDepartmentModel;
      emit(UpdateDepartmentSuccessState(updateDepartmentModel));
    });
  }
}
