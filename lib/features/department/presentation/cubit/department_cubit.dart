import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/department_model/department_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit(this.departmentRepository) : super(DepartmentInitialState());
  final DepartmentRepository departmentRepository;

  static DepartmentCubit get(context) => BlocProvider.of(context);

  DepartmentModel? departmentModel;

  Future<void> createDepartment({required String name}) async {
    emit(DepartmentLoadingState());
    Either<Failure, DepartmentModel> result;
    result = await departmentRepository.createDepartment(name: name);
    result.fold((failure) {
      emit(DepartmentFailureState(failure.error));
    }, (departmentModel) {
      this.departmentModel = departmentModel;
      emit(DepartmentSuccessState(departmentModel));
    });
  }
}
