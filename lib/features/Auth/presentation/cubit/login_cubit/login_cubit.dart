import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';
import 'package:tasks_app/features/Auth/data/models/login_model/login_model.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiServices) : super(LoginInitialState());

 final ApiServices apiServices;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    apiServices.post(endPoint: EndPoints.login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
      print(loginModel!.data!.email);
      print(loginModel!.data!.token);
    }).catchError((error){
      emit(LoginFailureState(error.toString()));
      print(error.toString());
    });
  }


}
