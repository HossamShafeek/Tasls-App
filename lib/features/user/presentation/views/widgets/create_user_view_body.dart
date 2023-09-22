import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/show_snack_bar.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/cretae_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/create_user_state.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/user_texts_fields_section.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/user_type_group.dart';

import '../../../../../core/utils/app_constants.dart';

class CrateUserViewBody extends StatelessWidget {
  const CrateUserViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is CreateUserSuccessState){
          showSuccessSnackBar(context: context, message: state.createUserModel.message!);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                state is CreateUserLoadingState? const LinearProgressIndicator():const SizedBox(),
                const TitleAndSubtitle(
                  subtitle: AppStrings.subtitleForCreateUser,
                ),
                const UserTextsFieldsSection(),
                const UserTypeGroup(),
                GradientButton(
                  onPressed: () {
                    if (CreateUserCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      CreateUserCubit.get(context).createUser();
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
