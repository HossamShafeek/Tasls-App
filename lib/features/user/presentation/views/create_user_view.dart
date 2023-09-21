import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/custom_back_button.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/create_user_view_body.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(
        ),
        title:const  Text(AppStrings.titleForCreateUser),
      ),
      body: const CrateUserViewBody(),
    );
  }
}
