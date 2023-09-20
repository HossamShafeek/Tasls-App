import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';
import 'package:tasks_app/features/user/data/models/employyees_model/employees_model.dart';
import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';

class UserRepositoryImplementation extends UserRepository {
  final ApiServices apiServices;

  UserRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, CreateUserModel>> createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    int? departmentId,
  }) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createUser,
          data: {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'user_type': userType,
          });
      return Right(CreateUserModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UsersModel>> getAllUsers() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
        token: AppConstants.token,
        endPoint: EndPoints.getAllUsers,
      );
      return Right(UsersModel.fromJson(data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateUserModel>> updateUser(
      {required String name,
      required int userId,
      required String email,
      required String phone,
      required String password,
      required String userType,
      required String userStatus,
      int? departmentId}) async {
    try {
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.updateUsers + userId.toString(),
          data: {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'user_type': userType,
            'user_status': 0,
          });
      return Right(CreateUserModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, EmployeesModel>> getAllEmployees() async{
    try {
      Map<String, dynamic> data = await apiServices.get(
        token: AppConstants.token,
        endPoint: EndPoints.getAllEmployees,
      );
      return Right(EmployeesModel.fromJson(data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
