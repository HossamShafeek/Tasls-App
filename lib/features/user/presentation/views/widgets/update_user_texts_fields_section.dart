import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/get_all_user_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class UpdateUserTextsFieldsSection extends StatelessWidget {
  const UpdateUserTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserCubit, UpdateUserState>(
      builder: (context, state) {
        return Form(
          key: UpdateUserCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: UpdateUserCubit.get(context).nameController,
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
                controller: UpdateUserCubit.get(context).emailController,
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
                controller: UpdateUserCubit.get(context).passwordController,
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
                controller: UpdateUserCubit.get(context).phoneController,
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
