import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/Auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/update_task_cubit/update_task_state.dart';

class DatePickerRangeForUpdate extends StatelessWidget {
  const DatePickerRangeForUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
          width: double.infinity,
          height: 220.h,
          decoration: BoxDecoration(
            color: const Color(0xffEEF2F5),
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstants.radius15w),
            ),
          ),
          child: CalendarDatePicker2(
            config:
                LoginCubit.get(context).loginModel!.data!.userType == 'employee'
                    ? CalendarDatePicker2Config(
                        lastDate: UpdateTaskCubit.get(context)
                            .multiDatePickerValueWithDefaultValue[1],
                        firstDate: UpdateTaskCubit.get(context)
                            .multiDatePickerValueWithDefaultValue[0],
                        currentDate: DateTime.now(),
                        calendarType: CalendarDatePicker2Type.range,
                      )
                    : CalendarDatePicker2Config(
                        firstDate: UpdateTaskCubit.get(context)
                            .multiDatePickerValueWithDefaultValue[0],
                        currentDate: DateTime.now(),
                        calendarType: CalendarDatePicker2Type.range,
                      ),
            value: UpdateTaskCubit.get(context)
                .multiDatePickerValueWithDefaultValue,
            onValueChanged: (dates) => UpdateTaskCubit.get(context)
                .multiDatePickerValueWithDefaultValue = dates,
          ),
        );
      },
    );
  }
}
