import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/update_user_cubit/update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.userRepository) : super(UpdateUserInitialState());
  final UserRepository userRepository;

  static UpdateUserCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  int groupValue = 0;

  void changeGroupValue({required int newValue}) {
    groupValue = newValue;
    emit(ChangeGroupValue());
  }

  CreateUserModel? updateUserModel;

  Future<void> updateUser({
    required dynamic userId,
    //required String departmentId,
  }) async {
    emit(UpdateUserLoadingState());
    Either<Failure, CreateUserModel> result;
    result = await userRepository.updateUser(
      userId: userId,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      userType: groupValue.toString(),
      userStatus: 0.toString(),
      departmentId: 4.toString(),
    );
    result.fold((failure) {
      emit(UpdateUserFailureState(failure.error));
      print('==================================================');
      print(failure.error);
      print('==================================================');
    }, (updateUserModel) {
      this.updateUserModel = updateUserModel;
      emit(UpdateUserSuccessState(updateUserModel));
      print('==================================================');
      print(updateUserModel.message);
      print('==================================================');
    });
  }
}
