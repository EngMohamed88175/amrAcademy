part of 'login_cubit.dart';

sealed class LoginAdminState extends Equatable {
  const LoginAdminState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginAdminState {}

final class LoginLoading extends LoginAdminState {}

final class LoginLoaded extends LoginAdminState {}

final class LoginFailed extends LoginAdminState {}


final class ChangeObscurePasswordState extends LoginAdminState {}


