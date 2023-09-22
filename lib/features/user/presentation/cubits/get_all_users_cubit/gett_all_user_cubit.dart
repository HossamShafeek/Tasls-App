import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_users_cubit/get_all_user_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.userRepository) : super(GetAllUsersInitialState());
  final UserRepository userRepository;

  static GetAllUsersCubit get(context) => BlocProvider.of(context);

  UsersModel? usersModel;

  Future<void> getAllUsers() async {
    emit(GetAllUsersLoadingState());
    Either<Failure, UsersModel> result;
    result = await userRepository.getAllUsers();
    result.fold((failure) {
      emit(GetAllUsersFailureState(failure.error));
    }, (usersModel) {
      this.usersModel = usersModel;
      emit(GetAllUsersSuccessState(usersModel));
    });
  }
}
