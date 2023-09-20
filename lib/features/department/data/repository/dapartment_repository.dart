import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, CreateDepartmentModel>> createDepartment(
      {required String name});

  Future<Either<Failure, DepartmentsModel>> getAllDepartments();

  Future<Either<Failure, CreateDepartmentModel>> updateDepartment({
    required int departmentId,
    required String managerId,
    required name,
  });

  Future<CreateDepartmentModel> updateDepartment2({
    required int departmentId,
    required String name,
    required int managerId,
  });
}
