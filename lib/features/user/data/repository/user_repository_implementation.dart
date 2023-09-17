import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/user_model/user_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';

class UserRepositoryImplementation extends UserRepository {

  final ApiServices apiServices;

  UserRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, UserModel>> createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    int? departmentId,
  }) async{
    try{
      Response data = await apiServices.post(
          token: CacheHelper.getString(key: 'token').toString(),
          endPoint: EndPoints.createUser,
          data: {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'user_type':userType,
          });
      // كان عندى خطأ هنا
      return Right(UserModel.fromJson(data.data));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
    }
  }
