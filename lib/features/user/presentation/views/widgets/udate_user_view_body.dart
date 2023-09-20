import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/user/data/models/users_model/datum.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_state.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/update_user_texts_fields_section.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/update_user_type_group.dart';

class UpdateUserViewBody extends StatelessWidget {
  const UpdateUserViewBody({Key? key, required this.user}) : super(key: key);

  final Datum user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(user.id);
        print(user.userCode);
        print('=================================');
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const TitleAndSubtitle(
                  title: AppStrings.titleForUpdateUser,
                  subtitle: AppStrings.subtitleForUpdateUser,
                ),
                const UpdateUserTextsFieldsSection(),
                const UpdateUserTypeGroup(),
                GradientButton(
                  onPressed: () {
                    if (UpdateUserCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      UpdateUserCubit.get(context).updateUser(
                        userId: user.id,
                      );
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
