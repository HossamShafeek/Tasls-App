import 'package:flutter/material.dart';
import 'package:tasks_app/core/functions/get_user_number.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/udate_user_view_body.dart';

class UpdateUserView extends StatefulWidget {
  const UpdateUserView({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.userType, required this.id,
  }) : super(key: key);

  final String name;
  final String email;
  final int phone;
  final String userType;
  final int id;

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  @override
  void initState() {
    UpdateUserCubit.get(context).nameController.text = widget.name;
    UpdateUserCubit.get(context).emailController.text = widget.email;
    UpdateUserCubit.get(context).phoneController.text = widget.phone.toString();
    UpdateUserCubit.get(context).groupValue =
        getUserNumber(userType: widget.userType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(
        ),
        title:const  Text(AppStrings.titleForUpdateUser),
      ),
      body: UpdateUserViewBody(
        id: widget.id,
      ),
    );
  }
}
