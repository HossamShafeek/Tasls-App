import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/create_task_texts_fields_section.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/custom_drop_down_widget.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/date_picker_range_widget.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
            child: Form(
              key: TaskCubit.get(context).formKey,
              child: Column(
                children: [
                  const TitleAndSubtitle(
                    title: AppStrings.titleForCreateTask,
                    subtitle: AppStrings.subtitleForCreateTask,
                  ),
                  const DatePickerRangeWidget(),
                  const CreateTaskTextsFieldsSection(),
                  const CustomDropDownWidget(),
                  GradientButton(
                    onPressed: () {
                      if (TaskCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        print(TaskCubit.get(context)
                            .multiDatePickerValueWithDefaultValue);
                        TaskCubit.get(context).createTask();
                      }
                    },
                    title: AppStrings.create,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
