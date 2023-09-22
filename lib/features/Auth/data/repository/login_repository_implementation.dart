import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/Auth/data/models/login_model/login_model.dart';
import 'package:tasks_app/features/Auth/data/repository/login_repository.dart';

class LoginRepositoryImplementation extends LoginRepository {
  final ApiServices apiServices;

  LoginRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password}) async {
    try {
      Response data = await apiServices.post(endPoint: EndPoints.login, data: {
        'email': email,
        'password': password,
      });
      LoginModel loginModel = LoginModel.fromJson(data.data);
      return Right(loginModel);
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
