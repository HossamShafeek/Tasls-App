import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/Auth/data/models/login_model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password});
}
