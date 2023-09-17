import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';

class CreateDepartmentViewBody extends StatelessWidget {
  const CreateDepartmentViewBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Form(
        key: DepartmentCubit.get(context).formKeyForCreate,
        child: Column(
          children: [
            const TitleAndSubtitle(
              title: AppStrings.titleForCreateDepartment,
              subtitle: AppStrings.subtitleForCreateDepartment,
            ),
            CustomTextField(
              controller: DepartmentCubit.get(context).nameControllerForCreate,
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
                if (DepartmentCubit.get(context).formKeyForCreate.currentState!.validate()) {
                  DepartmentCubit.get(context)
                      .createDepartment();
                }
              },
              title: AppStrings.create,
            ),
          ],
        ),
      ),
    );
  }
}
