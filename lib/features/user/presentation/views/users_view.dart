import 'package:flutter/material.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/gett_all_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/users_view_body.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    GetAllUsersCubit.get(context).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UsersViewBody(),
    );
  }
}
