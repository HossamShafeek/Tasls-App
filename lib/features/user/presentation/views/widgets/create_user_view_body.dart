import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/user/presentation/cubit/user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubit/user_state.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/user_texts_fields_section.dart';

import '../../../../../core/utils/app_constants.dart';

class CrateUserViewBody extends StatelessWidget {
  const CrateUserViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const TitleAndSubtitle(
                  title: AppStrings.titleForCreateUser,
                  subtitle: AppStrings.subtitleForCreateUser,
                ),
                const UserTextsFieldsSection(),
                UserTypeGroup(),
                GradientButton(
                  onPressed: () {
                    if (UserCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      UserCubit.get(context).createUser();
                    }
                  },
                  title: AppStrings.create,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UserTypeGroup extends StatelessWidget {
  const UserTypeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RadioMenuButton(
              value: 0,
              groupValue: UserCubit.get(context).groupValue,
              onChanged: (value) {
                UserCubit.get(context).changeGroupValue(newValue: value!);
              },
              child: Text(
                'Admin',
                style: AppStyles.textStyle14,
              ),
            ),
            RadioMenuButton(
              value: 1,
              groupValue: UserCubit.get(context).groupValue,
              child: Text(
                'Manager',
                style: AppStyles.textStyle14,
              ),
              onChanged: (value) {
                UserCubit.get(context).changeGroupValue(newValue: value!);
              },
            ),
            RadioMenuButton(
              value: 2,
              groupValue: UserCubit.get(context).groupValue,
              child: Text(
                'Employee',
                style: AppStyles.textStyle14,
              ),
              onChanged: (value) {
                UserCubit.get(context).changeGroupValue(newValue: value!);
              },
            ),
          ],
        );
      },
    );
  }
}
