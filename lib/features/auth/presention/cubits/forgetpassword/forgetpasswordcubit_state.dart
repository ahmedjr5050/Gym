part of 'forgetpasswordcubit_cubit.dart';

sealed class ForgetpasswordcubitState extends Equatable {
  const ForgetpasswordcubitState();

  @override
  List<Object> get props => [];
}

final class ForgetpasswordcubitInitial extends ForgetpasswordcubitState {}

final class ForgetpasswordcubitLoading extends ForgetpasswordcubitState {}

final class ForgetpasswordcubitSuccess extends ForgetpasswordcubitState {
  final String message;

  const ForgetpasswordcubitSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class ForgetpasswordcubitError extends ForgetpasswordcubitState {
  final String error;

  const ForgetpasswordcubitError({required this.error});

  @override
  List<Object> get props => [error];
}
