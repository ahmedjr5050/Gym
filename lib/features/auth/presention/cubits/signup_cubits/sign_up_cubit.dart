import 'package:bloc/bloc.dart';
import 'package:fitflow/features/auth/domain/entities/user_entitiy.dart';
import 'package:fitflow/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(SignUpLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(
        SignUpError(failure.message),
      ),
      (UserEntity) => emit(
        SignUpSuccess(
          userEntity: UserEntity,
        ),
      ),
    );
  }
}
