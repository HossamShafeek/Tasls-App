import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/get_all_user_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class UpdateUserTypeGroup extends StatelessWidget {
  const UpdateUserTypeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserCubit, UpdateUserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RadioMenuButton(
              value: 0,
              groupValue: UpdateUserCubit.get(context).groupValue,
              onChanged: (value) {
                UpdateUserCubit.get(context).changeGroupValue(newValue: value!);
              },
              child: Text(
                'Admin',
                style: AppStyles.textStyle14,
              ),
            ),
            RadioMenuButton(
              value: 1,
              groupValue: UpdateUserCubit.get(context).groupValue,
              child: Text(
                'Manager',
                style: AppStyles.textStyle14,
              ),
              onChanged: (value) {
                UpdateUserCubit.get(context).changeGroupValue(newValue: value!);
              },
            ),
            RadioMenuButton(
              value: 2,
              groupValue: UpdateUserCubit.get(context).groupValue,
              child: Text(
                'Employee',
                style: AppStyles.textStyle14,
              ),
              onChanged: (value) {
                UpdateUserCubit.get(context).changeGroupValue(newValue: value!);
              },
            ),
          ],
        );
      },
    );
  }
}