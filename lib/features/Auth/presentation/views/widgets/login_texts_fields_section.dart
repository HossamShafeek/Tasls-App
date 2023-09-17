import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_state.dart';

class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                title: AppStrings.email,
                prefixIcon: const Icon(IconBroken.Message),
                hintText: AppStrings.enterEmail,
                textInputType: TextInputType.emailAddress,
                controller: LoginCubit.get(context).emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.enterEmailValidation;
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: AppStrings.password,
                obscureText: LoginCubit.get(context).isShowPassword,
                prefixIcon: const Icon(IconBroken.Lock),
                suffixIcon: InkWell(
                  onTap: () {
                    LoginCubit.get(context).changePasswordVisibility();
                  },
                  child: Icon(
                    LoginCubit.get(context).isShowPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.grey,
                  ),
                ),
                hintText: AppStrings.enterPassword,
                textInputType: TextInputType.text,
                controller: LoginCubit.get(context).passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.enterPasswordValidation;
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
