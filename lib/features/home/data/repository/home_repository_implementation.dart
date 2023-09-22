import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/data/models/create_task_model/create_task_model.dart';
import 'package:tasks_app/features/home/data/models/tasks_model/tasks_model.dart';
import 'package:tasks_app/features/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CreateTaskModel>> createTask({
    required String title,
    required String description,
    //required String status,
    required String startDate,
    required String endDate,
    required String employeeId,
    int? departmentId,
  }) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createTask,
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
      if (error is DioError) {
        return Left(ServerFailure(
            error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, TasksModel>> getAllTasks() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
        token: AppConstants.token,
        endPoint: EndPoints.getAllTasks,
      );
      return Right(TasksModel.fromJson(data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(
            error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CreateTaskModel>> updateTask({
    required String title,
    required String description,
    required String status,
    required String startDate,
    required String endDate,
    required String employeeId,
    required String taskId,
    int? departmentId,
  }) async{
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.updateTask+taskId,
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
      if (error is DioError) {
        return Left(ServerFailure(
            error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
