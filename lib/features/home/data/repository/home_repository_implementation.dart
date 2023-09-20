import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CreateTaskModel>> createTask({
    required String title,
    required String description,
    //required String status,
    required DateTime startDate,
    required DateTime endDate,
    required String employeeId,
    int? departmentId,
  }) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createUser,
          data: {
            'name': title,
            'description': description,
            'status': '0',
            'start_date': startDate,
            'end_date': endDate,
            'employee_id': employeeId,
          });
      return Right(CreateTaskModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
