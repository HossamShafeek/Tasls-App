import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/department_model/department_model.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, DepartmentModel>> createDepartment(
      {required String name});
}
