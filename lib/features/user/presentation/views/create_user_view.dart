import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/cretae_user_cubit.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/create_user_view_body.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {

  @override
  void deactivate() {
    CreateUserCubit.get(context).emailController.clear();
    CreateUserCubit.get(context).nameController.clear();
    CreateUserCubit.get(context).passwordController.clear();
    CreateUserCubit.get(context).phoneController.clear();
    CreateUserCubit.get(context).groupValue=0;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.titleForCreateUser),
      ),
      body: const CrateUserViewBody(),
    );
  }
}
