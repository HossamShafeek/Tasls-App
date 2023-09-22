import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/create_user_model/craete_user_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/create_user_cubit/create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.userRepository) : super(UserInitialState());
  final UserRepository userRepository;

  static CreateUserCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CreateUserModel? createUserModel;

  Future<void> createUser({
    int? departmentId,
  }) async {
    emit(CreateUserLoadingState());
    Either<Failure, CreateUserModel> result;
    result = await userRepository.createUser(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      userType: groupValue.toString(), departmentId: 4.toString(),
    );
    result.fold((failure) {
      emit(CreateUserFailureState(failure.error));
      print(failure.error);
    }, (createUserModel) {
      this.createUserModel = createUserModel;
      print(createUserModel.message);
      emit(CreateUserSuccessState(createUserModel));
    });
  }

  int groupValue = 0;

  void changeGroupValue({required int newValue}) {
    groupValue = newValue;
    emit(ChangeGroupValue());
  }
}
