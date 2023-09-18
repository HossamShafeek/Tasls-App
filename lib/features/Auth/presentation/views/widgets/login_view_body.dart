import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:tasks_app/features/Auth/presentation/views/widgets/keep_me_logged_in.dart';
import 'package:tasks_app/features/Auth/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:tasks_app/features/home/presentation/views/home_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.setString(
            key: 'token',
            value: LoginCubit.get(context).loginModel!.data!.token!,
          );
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ));
        }
      },
      builder: (context, state) {
        return AnnotatedRegion(
          value: AppConstants.systemUiOverlayStyle,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleAndSubtitle(
                  title: AppStrings.titleForLogin,
                  subtitle: AppStrings.subtitleForLogin,
                ),
                const LoginTextsFieldsSection(),
                const KeepMeLoggedIn(),
                GradientButton(
                  onPressed: () {
                    if (LoginCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      LoginCubit.get(context).userLogin(
                        email: LoginCubit.get(context).emailController.text,
                        password:
                            LoginCubit.get(context).passwordController.text,
                      );
                    }
                  },
                  title: AppStrings.login,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
