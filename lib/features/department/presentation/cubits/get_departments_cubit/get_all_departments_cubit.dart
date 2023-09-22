import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_state.dart';

class GetAllDepartmentsCubit extends Cubit<GetAllDepartmentsState> {
  GetAllDepartmentsCubit(this.departmentRepository)
      : super(GetAllDepartmentsInitialState());
  final DepartmentRepository departmentRepository;

  static GetAllDepartmentsCubit get(context) => BlocProvider.of(context);

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
}
