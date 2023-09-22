import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/errors/failures.dart';
import 'package:tasks_app/features/user/data/repository/user_repository.dart';
import 'package:tasks_app/features/user/presentation/cubits/delete_usre_cubit/delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState>{
  DeleteUserCubit(this.userRepository):super(DeleteUserInitialState());

  final UserRepository userRepository;

  static DeleteUserCubit get(BuildContext context)=>BlocProvider.of(context);

  Future<void> deleteUser({required String userId})async{
    emit(DeleteUserLoadingState());
    Either<Failure,Map<String,dynamic>> result;
    result = await userRepository.deleteUser(userId: userId);
    result.fold((failure) {
      emit(DeleteUserFailureState(failure.error));
    }, (data) {
      emit(DeleteUserSuccessState(data['message']));
    });
  }

}