import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/functions/show_snack_bar.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/gradient_button.dart';
import 'package:tasks_app/core/widgets/title_and_subtitle.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_state.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/date_picker_range_for_update.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/update_radio_buttons_section.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/update_texts_fields_section.dart';

class UpdateTaskViewBody extends StatelessWidget {
  const UpdateTaskViewBody(
      {Key? key, required this.taskId, required this.employeeId})
      : super(key: key);

  final String taskId;
  final String employeeId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
      listener: (context, state) {
        if (state is UpdateTaskFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is UpdateTaskSuccessState){
          showSuccessSnackBar(context: context, message: state.updateTaskModel.message!);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: UpdateTaskCubit.get(context).formKey,
              child: Column(
                children: [
                  state is UpdateTaskLoadingState? const LinearProgressIndicator():const SizedBox(),
                  const TitleAndSubtitle(
                      subtitle: AppStrings.subtitleForUpdateTask),
                  const DatePickerRangeForUpdate(),
                  const UpdateTextsFieldsSection(),
                  const UpdateRadioButtonsSection(),
                  GradientButton(
                    onPressed: () {
                      if(UpdateTaskCubit.get(context).formKey.currentState!.validate()){
                        UpdateTaskCubit.get(context).updateTask(
                            taskId: taskId, employeeId: employeeId);
                      }
                    },
                    title: AppStrings.update,
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
