import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/cubits/task_cubit/task_state.dart';

class DatePickerRangeWidget extends StatefulWidget {
  const DatePickerRangeWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerRangeWidget> createState() => _DatePickerRangeWidgetState();
}

class _DatePickerRangeWidgetState extends State<DatePickerRangeWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
          width: double.infinity,
          height: 220.h,
          decoration: BoxDecoration(
            color: const Color(0xffEEF2F5),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.radius15w)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            //],
          ),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              firstDate: DateTime.now(),
              currentDate: DateTime.now(),
              calendarType: CalendarDatePicker2Type.range,
            ),
            value: TaskCubit.get(context).multiDatePickerValueWithDefaultValue,
            onValueChanged: (dates) => TaskCubit.get(context)
                .multiDatePickerValueWithDefaultValue = dates,
          ),
        );
      },
    );
  }
}
