import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/user_model/user_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitialState());
  final UserRepository userRepository;

  static UserCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  UserModel? userModel;

  Future<void> createUser({
    int? departmentId,
  }) async {
    emit(UserLoadingState());
    Either<Failure, UserModel> result;
    result = await userRepository.createUser(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      userType: groupValue,
      // departmentId: 81
    );
    result.fold((failure) {
      emit(UserFailureState(failure.error));
      print(failure.error);
    }, (userModel) {
      this.userModel = userModel;
      emit(UserSuccessState(userModel));
      print(userModel.data!.name);
      print(userModel.data!.userType);
      print(userModel.data!.phone);
    });
  }

  int groupValue = 0;

  void changeGroupValue({required int newValue}) {
    groupValue = newValue;
    emit(ChangeGroupValue());
  }
}
