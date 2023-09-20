import 'package:flutter/material.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/create_task_view_body.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CreateTaskViewBody(),
    );
  }
}

// class DatePickerRangeWidget extends StatelessWidget {
//   const DatePickerRangeWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 300,
//       child: SfDateRangePicker(
//           view: DateRangePickerView.month,
//           monthViewSettings:
//                DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
//           selectionMode: DateRangePickerSelectionMode.multiple,
//           showActionButtons: true,
//           onSubmit: (val) {
//             print(val);
//           },
//           onCancel: () {}),
//     );
//   }
// }
