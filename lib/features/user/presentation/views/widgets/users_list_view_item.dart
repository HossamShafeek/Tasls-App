import 'package:flutter/material.dart';
import 'package:tasks_app/config/icons/icons_broken.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';
import 'package:tasks_app/core/utils/app_strings.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_body.dart';
import 'package:tasks_app/core/widgets/employees_list_view_item_head.dart';
import 'package:tasks_app/features/user/data/models/users_model/datum.dart';
import 'package:tasks_app/features/user/presentation/views/update_user_view.dart';

class UsersGridViewItem extends StatelessWidget {
  const UsersGridViewItem({
    Key? key,
    required this.usersModel,
  }) : super(key: key);
  final Datum usersModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.padding8h),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10w),
      ),
      child: Column(
        children: [
          ListViewItemHead(
            title: usersModel.userType!,
            editOnTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateUserView(
                    id: usersModel.id!,
                    name: usersModel.name!,
                    email: usersModel.email!,
                    phone: usersModel.phone!,
                    userType: usersModel.userType!,
                  );
                },
              ));
            },
            deleteOnTap: () {},
          ),
          Expanded(
            child: Image.asset(
              AppStrings.userImage,
              fit: BoxFit.fill,
            ),
          ),
          ListViewItemBody(
            firstTitle: usersModel.name!,
            secondTitle: usersModel.email!,
            secondTitleIcon: IconBroken.Message,
            thirdTitle: usersModel.phone.toString(),
            thirdTitleIcon: IconBroken.Call,
          ),
        ],
      ),
    );
  }
}
