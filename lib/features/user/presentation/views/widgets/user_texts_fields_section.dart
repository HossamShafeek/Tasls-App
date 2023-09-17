import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/user/presentation/cubit/user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubit/user_state.dart';

class UserTextsFieldsSection extends StatelessWidget {
  const UserTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Form(
          key: UserCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: UserCubit.get(context).nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter your name',
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: UserCubit.get(context).emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                title: 'Email',
                hintText: 'Enter your email',
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: UserCubit.get(context).passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password is too short';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Enter your password',
              ),
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: UserCubit.get(context).phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
                title: 'Phone',
                hintText: 'Enter your phone',
                maxLength: 11,
                paddingForBottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
