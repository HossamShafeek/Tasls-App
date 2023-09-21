import 'package:dartz/dartz.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';
import 'package:tasks_app/features/user/data/models/employyees_model/employees_model.dart';
import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';

abstract class UserRepository {
  Future<Either<Failure, CreateUserModel>> createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    int? departmentId,
  });

  Future<Either<Failure, UsersModel>> getAllUsers();

  Future<Either<Failure, CreateUserModel>> updateUser({
    required int userId,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String userType,
    required String userStatus,
    int? departmentId,
  });

  Future<Either<Failure, EmployeesModel>> getAllEmployees();
}
