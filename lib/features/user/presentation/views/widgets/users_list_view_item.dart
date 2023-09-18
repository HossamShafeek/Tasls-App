import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';
import 'package:tasks_app/features/user/presentation/views/update_user_view.dart';

class UsersListViewItem extends StatelessWidget {
  const UsersListViewItem(
      {Key? key, required this.usersModel, required this.index})
      : super(key: key);
  final UsersModel usersModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usersModel.data![index].name!),
      subtitle: Text(usersModel.data![index].userType!),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateUserView(
                user: usersModel.data![index],
              ),
            ),
          );
        },
        icon: const Icon(IconBroken.Edit),
      ),
    );
  }
}