import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_styles.dart';
import 'package:tasks_app/core/widgets/custom_app_bar.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/circular_progress_grop.dart';

class HomeViewForUser extends StatelessWidget {
  const HomeViewForUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewForUserBody(),
    );
  }
}

class HomeViewForUserBody extends StatelessWidget {
  const HomeViewForUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(rightWidget: CircularProgressGroup()),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                children: const [
                  DatePickerWidget(),
                  Expanded(child: UserTasksListView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: 100,
      width: 70,
      initialSelectedDate: DateTime.now(),
      selectedTextColor: AppColors.white,
      selectionColor: AppColors.deepPurple,
      onDateChange: (newDate) {},
      dayTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
      dateTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.grey500,
        ),
      ),
      monthTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class UserTasksListView extends StatelessWidget {
  const UserTasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasksList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            //border: Border.all(color: Colors.black,width: 1)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 2,
                    height: 70,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tasksList[index].body,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const Icon(Icons.more_vert),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(tasksList[index].secBody),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.watch_later),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    tasksList[index].timeText,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.padding5h,
        );
      },
    );
  }
}

//Row(
//   children: [
//     CircularProgressIndicator(
//       value: 0.2,
//       color: AppColors.greenAccent,
//       backgroundColor: Colors.greenAccent.withOpacity(0.5),
//       semanticsLabel: '9/20',
//     ),
//     SizedBox(width: AppConstants.defaultPaddingW,),
//     SizedBox(
//       height: 50,
//       width: 50,
//       child: CircularProgressIndicator(
//         value: 0.2,
//         color: AppColors.orangeAccent,
//         backgroundColor: Colors.orangeAccent.withOpacity(0.5),
//         semanticsLabel: '9/20',
//         semanticsValue: '9/20',
//       ),
//     ),
//     SizedBox(width: AppConstants.defaultPaddingW,),
//     CircularProgressIndicator(
//       value: 0.2,
//       color: AppColors.redAccent,
//       backgroundColor: Colors.redAccent.withOpacity(0.5),
//     ),
//   ],
// );

class TasksModel {
  String body;
  String secBody;
  String timeText;

  TasksModel(this.body, this.secBody, this.timeText);
}

List<TasksModel> tasksList = [
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
  TasksModel('Create a high intensity interval ',
      'design a 20 minutes to regret', 'starts 12/9/2023  - end 12/9/2023'),
];
