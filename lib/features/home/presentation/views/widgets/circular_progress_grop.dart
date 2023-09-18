import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/circular_progress_group_item.dart';

class CircularProgressGroup extends StatelessWidget {
  const CircularProgressGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularProgressGroupItem(
          percent: 0.5,
          center: '9/20',
          progressColor: Colors.greenAccent,
          backgroundColor: Colors.greenAccent.withOpacity(0.5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.padding10w,
          ),
          child: CircularProgressGroupItem(
            percent: 0.25,
            center: '5/20',
            progressColor: Colors.orangeAccent,
            backgroundColor: Colors.orangeAccent.withOpacity(0.5),
          ),
        ),
        CircularProgressGroupItem(
          percent: 0.15,
          center: '4/20',
          progressColor: Colors.redAccent,
          backgroundColor: Colors.redAccent.withOpacity(0.5),
        ),
      ],
    );
  }
}