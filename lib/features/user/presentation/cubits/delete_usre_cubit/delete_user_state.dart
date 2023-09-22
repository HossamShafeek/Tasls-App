abstract class DeleteUserState{}

class DeleteUserInitialState extends DeleteUserState{}
class DeleteUserLoadingState extends DeleteUserState{}
class DeleteUserSuccessState extends DeleteUserState{
  final String message;
  DeleteUserSuccessState(this.message);
}
class DeleteUserFailureState extends DeleteUserState{
  final String error;
  DeleteUserFailureState(this.error);
}