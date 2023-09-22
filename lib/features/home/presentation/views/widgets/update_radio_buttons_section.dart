import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

class UpdateRadioButtonsSection extends StatelessWidget {
  const UpdateRadioButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UpdateTaskCubit,UpdateTaskState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Task Status',style: AppStyles.textStyle16,),
          SizedBox(height: AppConstants.padding5h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RadioMenuButton(
                value: 0,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'New',
                  style: AppStyles.textStyle14,
                ),
              ),
              RadioMenuButton(
                value: 1,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Processing',
                  style: AppStyles.textStyle14,
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RadioMenuButton(
                value: 2,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Completed',
                  style: AppStyles.textStyle14,
                ),
              ),
              RadioMenuButton(
                value: 3,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Not Completed',
                  style: AppStyles.textStyle14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              RadioMenuButton(
                value: 4,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Cancelled',
                  style: AppStyles.textStyle14,
                ),
              ),
              RadioMenuButton(
                value: 5,
                groupValue: UpdateTaskCubit.get(context).groupValue,
                onChanged: (value) {
                  UpdateTaskCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Expired',
                  style: AppStyles.textStyle14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.padding10h,),
        ],
      );
    },);
  }
}
