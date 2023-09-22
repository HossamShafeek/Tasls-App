import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/models/users_model/users_model.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/get_all_managers_cubit/get_all_managers_state.dart';

class GetAllManagersCubit extends Cubit<GetAllManagersState> {
  GetAllManagersCubit(this.userRepository)
      : super(GetAllManagersInitialState());
  final UserRepository userRepository;

  static GetAllManagersCubit get(context) => BlocProvider.of(context);

  UsersModel? managersModel;

  Future<void> getAllManagers() async {
    emit(GetAllManagersLoadingState());
    Either<Failure, UsersModel> result;
    result = await userRepository.getAllManagers();
    result.fold((failure) {
      emit(GetAllManagersFailureState(failure.error));
    }, (managersModel) {
      this.managersModel = managersModel;
      emit(GetAllManagersSuccessState(managersModel));
    });
  }

  String? dropdownValue;
}
