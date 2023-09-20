import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/get_all_user_state.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/gett_all_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/users_list_view_item.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        if (state is GetAllUsersSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.usersModel.data!.length,
            itemBuilder: (context, index) {
              return UsersListViewItem(
                  usersModel: state.usersModel, index: index);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
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
