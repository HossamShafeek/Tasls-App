import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/Auth/data/models/login_model/login_model.dart';
import 'package:tasks_app/features/Auth/data/repository/login_repository.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitialState());

  final LoginRepository loginRepository;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibility());
  }

  bool keepMeLoggedIn = false;
  void changeKeepMeLoggedIn({required bool value}) {
    keepMeLoggedIn = value;
    emit(LoginChangeKeepMeLoggedIn());
  }

  LoginModel? loginModel;
  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    Either<Failure, LoginModel> result;
    result = await loginRepository.userLogin(email: email, password: password);
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (loginModel) {
      this.loginModel = loginModel;
      AppConstants.token = loginModel.data!.token!;
      print(loginModel.data!.email);
      emit(LoginSuccessState(loginModel));
    });
  }
}
