import 'package:flutter/material.dart';
import 'package:tasks_app/core/functions/get_user_number.dart';
import 'package:tasks_app/features/user/data/models/users_model/datum.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/udate_user_view_body.dart';

class UpdateUserView extends StatefulWidget {
  const UpdateUserView({Key? key, required this.user}) : super(key: key);

  final Datum user;

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {

  @override
  void initState() {
    UpdateUserCubit.get(context).nameController.text=widget.user.name!;
    UpdateUserCubit.get(context).emailController.text=widget.user.name!;
    UpdateUserCubit.get(context).phoneController.text=widget.user.name!;
    UpdateUserCubit.get(context).passwordController.text=widget.user.name!;
    UpdateUserCubit.get(context).groupValue=getUserNumber(userType: widget.user.userType!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  UpdateUserViewBody(user: widget.user,),
    );
  }
}


