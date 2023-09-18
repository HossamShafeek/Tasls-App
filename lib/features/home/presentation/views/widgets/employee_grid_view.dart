import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/home/presentation/views/widgets/employee_grid_view_item.dart';

class EmployeeGridView extends StatelessWidget {
  const EmployeeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(top: AppConstants.padding8h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: AppConstants.padding10w,
      mainAxisSpacing: AppConstants.padding10w,
      itemCount: 4,
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(1, index.isEven ? 0.8 : 0.7);
      },
      itemBuilder: (context, index) => const EmployeeGridViewItem(),
    );
  }
}