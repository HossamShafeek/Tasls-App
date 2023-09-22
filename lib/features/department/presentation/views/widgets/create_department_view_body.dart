import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/show_snack_bar.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubits/create_department_cubit/create_department_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/create_department_cubit/create_department_state.dart';

class CreateDepartmentViewBody extends StatelessWidget {
  const CreateDepartmentViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateDepartmentCubit,CreateDepartmentState>(
      listener: (context, state) {
        if (state is CreateDepartmentFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is CreateDepartmentSuccessState){
          showSuccessSnackBar(context: context, message: state.departmentModel.message!);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Form(
            key: CreateDepartmentCubit.get(context).formKeyForCreate,
            child: Column(
              children: [
                state is CreateDepartmentLoadingState? const LinearProgressIndicator():const SizedBox(),
                const TitleAndSubtitle(
                  subtitle: AppStrings.subtitleForCreateDepartment,
                ),
                CustomTextField(
                  controller:
                  CreateDepartmentCubit.get(context).nameControllerForCreate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter department name';
                    }
                    return null;
                  },
                  title: 'Name',
                  hintText: 'Enter department name',
                ),
                GradientButton(
                  onPressed: () {
                    if (CreateDepartmentCubit.get(context)
                        .formKeyForCreate
                        .currentState!
                        .validate()) {
                      CreateDepartmentCubit.get(context).createDepartment();
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
