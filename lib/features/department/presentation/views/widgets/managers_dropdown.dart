import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custom_dropdown.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_managers_cubit/get_all_managers_cubit.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_managers_cubit/get_all_managers_state.dart';

class ManagersDropdown extends StatefulWidget {
  const ManagersDropdown({Key? key}) : super(key: key);

  @override
  State<ManagersDropdown> createState() => _ManagersDropdownState();
}

class _ManagersDropdownState extends State<ManagersDropdown> {
  @override
  void initState() {
    GetAllManagersCubit.get(context).getAllManagers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllManagersCubit, GetAllManagersState>(
      builder: (context, state) {
        if (state is GetAllManagersSuccessState) {
          return CustomDropdown(
            title: 'Manager',
            hintText: 'Assigned manager',
            messageForValidate: 'Please assigned manager',
            items: state.managersModel.data!
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name!),
                  ),
                )
                .toList(),
            onChange: (value) {
              GetAllManagersCubit.get(context).dropdownValue =
                  value.id.toString();
            },
          );
        } else if (state is GetAllManagersFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is GetAllManagersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
