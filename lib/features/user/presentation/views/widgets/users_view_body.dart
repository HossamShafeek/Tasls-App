import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/get_all_user_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/gett_all_user_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/users_list_view_item.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        if (state is GetAllUsersSuccessState) {
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.padding8h,
              horizontal: AppConstants.defaultPadding,
            ),
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: AppConstants.padding10w,
            mainAxisSpacing: AppConstants.padding10w,
            itemCount: state.usersModel.data!.length,
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
            },
            itemBuilder: (context, index) => UsersGridViewItem(
              usersModel: state.usersModel.data![index],
            ),
          );
        } else if (state is GetAllUsersFailureState) {
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
