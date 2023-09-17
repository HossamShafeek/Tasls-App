import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/custom_text_field.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/department/presentation/cubit/department_cubit.dart';

class UpdateDepartmentView extends StatelessWidget {
  const UpdateDepartmentView({
    Key? key,
    required this.departmentId,
  }) : super(key: key);

  final int departmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UpdateDepartmentViewBody(),
    );
  }
}

class UpdateDepartmentViewBody extends StatelessWidget {
  const UpdateDepartmentViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleAndSubtitle(
            title: ' Update Department!',
            subtitle:
                'Update  department details and assign a new manager to continue work!',
          ),
          CustomTextField(
            controller: DepartmentCubit.get(context).nameControllerForUpdate,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter department name';
              }
              return null;
            },
            title: 'Name',
            hintText: 'Enter department name',
          ),
          Text('Manager',style: AppStyles.textStyle16,),
          Container(
            margin: EdgeInsets.only(top: AppConstants.defaultPadding,bottom:AppConstants.padding15h),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.padding10w),
            color: AppColors.grey50,
            child: DropdownButton(
              isExpanded: true,
              borderRadius: BorderRadius.circular(AppConstants.radius8w),
              underline: const SizedBox(),
              hint: Text('Assigned Manager',style: AppStyles.textStyle14,),
              items: [
                'hossam',
                'ahmed',
                'samy',
              ].map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
              onChanged: (value) {},
            ),
          ),
          GradientButton(
            onPressed: () {},
            title: AppStrings.update,
          )
        ],
      ),
    );
  }
}
