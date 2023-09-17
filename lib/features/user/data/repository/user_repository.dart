import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/user_model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    int? departmentId,
  });
}
