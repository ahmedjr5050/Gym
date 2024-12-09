import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflow/core/errors/exception.dart';
import 'package:fitflow/features/auth/domain/repos/auth_repo.dart';

part 'forgetpasswordcubit_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordcubitState> {
  ForgetpasswordCubit(this.authRepo) : super(ForgetpasswordcubitInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword(String email) async {
    emit(ForgetpasswordcubitLoading());
    try {
      await authRepo.resetPassword(email);
      emit(ForgetpasswordcubitSuccess(message: 'Password reset link sent to your email.'));
    } catch (e) {
      String errorMessage;
      if (e is CustomException) {
        errorMessage = 'Network error, please check your connection and try again.';
      } else if (e is ForgetpasswordcubitError) {
        errorMessage = 'Email could not be sent, please check your email configuration.';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      emit(ForgetpasswordcubitError(error: errorMessage));
    }
  }
}
