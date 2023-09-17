import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/department/data/models/department_model/department_model.dart';
import 'package:tasks_app/features/department/data/repository/dapartment_repository.dart';

class DepartmentRepositoryImplementation extends DepartmentRepository {
  final ApiServices apiServices;

  DepartmentRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, DepartmentModel>> createDepartment(
      {required String name}) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createDepartment,
          data: {
            'name': name,
          });
      // كان عندى خطأ هنا
      return Right(DepartmentModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
