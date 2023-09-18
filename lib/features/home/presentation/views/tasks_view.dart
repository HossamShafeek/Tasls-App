import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TasksViewBody(),
    );
  }
}

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tasks View'),
      ],
    );
  }
}

