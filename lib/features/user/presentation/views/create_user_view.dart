import 'package:flutter/material.dart';
import 'package:tasks_app/features/user/presentation/views/widgets/create_user_view_body.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: const CrateUserViewBody(),
    );
  }
}
