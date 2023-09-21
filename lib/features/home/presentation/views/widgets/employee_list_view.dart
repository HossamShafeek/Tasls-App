import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/features/department/data/models/departments_model/employee.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employees_list_view_item.dart';

class EmployeesListView extends StatelessWidget {
  const EmployeesListView({Key? key, required this.employees})
      : super(key: key);

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: employees.length,
      itemBuilder: (context, index, s) {
        return EmployeesListViewItem(employee: employees[index]);
      },
      options: CarouselOptions(
        aspectRatio: 1.5,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
      ),
    );
  }
}



