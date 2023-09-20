import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, CreateTaskModel>> createTask({
    required String title,
    required String description,
   // required String status,
    required DateTime startDate,
    required DateTime endDate,
    required String employeeId,
    int? departmentId,
  });
}
