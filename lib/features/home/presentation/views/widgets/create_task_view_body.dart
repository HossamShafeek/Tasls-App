import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/show_snack_bar.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/create_task_cubit/create_task_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/create_task_texts_fields_section.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employees_dropdown.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/date_picker_range_for_create.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is CreateTaskSuccessState){
          showSuccessSnackBar(context: context, message: state.createTaskModel.message!);
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
            child: Form(
              key: CreateTaskCubit.get(context).formKey,
              child: Column(
                children: [
                  state is CreateTaskLoadingState? const LinearProgressIndicator():const SizedBox(),
                  const TitleAndSubtitle(
                    subtitle: AppStrings.subtitleForCreateTask,
                  ),
                  const DatePickerRangeForCreate(),
                  const CreateTaskTextsFieldsSection(),
                  const EmployeesDropdown(),
                  GradientButton(
                    onPressed: () {
                      if (CreateTaskCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        print(CreateTaskCubit.get(context)
                            .multiDatePickerValueWithDefaultValue);
                        CreateTaskCubit.get(context).createTask();
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
