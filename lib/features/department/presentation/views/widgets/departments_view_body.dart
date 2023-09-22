import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_cubit.dart';
import 'package:tasks_app/features/department/presentation/cubits/get_departments_cubit/get_all_departments_state.dart';
import 'package:tasks_app/features/department/presentation/views/widgets/department_grid_view_item.dart';

class DepartmentsViewBody extends StatelessWidget {
  const DepartmentsViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDepartmentsCubit, GetAllDepartmentsState>(
      builder: (context, state) {
        if (state is GetAllDepartmentsSuccessState) {
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.padding8h,
              horizontal: AppConstants.defaultPadding,
            ),
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: AppConstants.padding10w,
            mainAxisSpacing: AppConstants.padding10w,
            itemCount: state.departmentModel.data!.length,
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
            },
            itemBuilder: (context, index) => DepartmentsGridViewItem(
              departmentsModel: state.departmentModel.data![index],
            ),
          );
        } else if (state is GetAllDepartmentsFailureState) {
          return Center(
            child: Text(state.error, textAlign: TextAlign.center),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
