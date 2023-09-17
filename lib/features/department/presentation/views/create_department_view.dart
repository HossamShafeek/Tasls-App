import 'package:flutter/material.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';

class CreateDepartmentView extends StatelessWidget {
  const CreateDepartmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DepartmentViewBody(),
    );
  }
}

class DepartmentViewBody extends StatelessWidget {
   DepartmentViewBody({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const TitleAndSubtitle(
              title: AppStrings.titleForCreateDepartment,
              subtitle: AppStrings.subtitleForCreateDepartment,
            ),
            CustomTextField(
              controller: nameController,
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
                if (formKey.currentState!.validate()) {
                  DepartmentCubit.get(context)
                      .createDepartment(name: nameController.text);
                  print(CacheHelper.getString(key: 'token'));
                  print(nameController.text);
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
