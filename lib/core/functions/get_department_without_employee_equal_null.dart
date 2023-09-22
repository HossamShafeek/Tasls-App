import 'package:tasks_app/features/department/data/models/departments_model/datum.dart';

List<Datum> getDepartmentWithoutEmployeeEqualNull(
    {required List<Datum> departments}) {
  return departments.where((department) {
    return department.employees!.isNotEmpty;
  }).toList();
}
