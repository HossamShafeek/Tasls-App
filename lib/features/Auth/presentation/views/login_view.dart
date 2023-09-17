import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/api/api_services_implementation.dart';
import 'package:tasks_app/features/Auth/data/repository/login_repository_implementation.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          LoginRepositoryImplementation(ApiServicesImplementation())),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginViewBody(),
      ),
    );
  }
}
