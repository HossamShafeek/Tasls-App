import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/department/data/models/create_department_model/department_model.dart';
import 'package:tasks_app/features/department/data/models/departments_model/departments_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';

class DepartmentRepositoryImplementation extends DepartmentRepository {
  final ApiServices apiServices;

  DepartmentRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CreateDepartmentModel>> createDepartment(
      {required String name}) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createDepartment,
          data: {
            'name': name,
          });
      return Right(CreateDepartmentModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, DepartmentsModel>> getAllDepartments() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
        token: AppConstants.token,
        endPoint: EndPoints.getAllDepartments,
      );
      return Right(DepartmentsModel.fromJson(data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateDepartmentModel>> updateDepartment({
    required int departmentId,
    required String managerId,
    required name,
  }) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.updateDepartments + departmentId.toString(),
          data: {
            'manager_id': managerId,
            'name': name,
          });
      return Right(CreateDepartmentModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(
            error.response!.data['message']['user_status'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  Future<CreateDepartmentModel> updateDepartment2({
    required int departmentId,
    required String name,
    required int managerId,
  }) async {
    Response data = await apiServices.post(
        token: CacheHelper.getString(key: 'token').toString(),
        endPoint: EndPoints.updateDepartments + departmentId.toString(),
        data: {
          'manager_id': managerId.toString(),
          'name': name,
        });
    print(data);
    return CreateDepartmentModel.fromJson(data.data);
  }
}
