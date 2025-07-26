part of 'register_cubit.dart';

sealed class RegisterDiskTopState extends Equatable {
  const RegisterDiskTopState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterDiskTopState {}

final class RegisterLoding extends RegisterDiskTopState {}

final class RegisterLoaded extends RegisterDiskTopState {}

final class RegisterFailed extends RegisterDiskTopState {}

final class ChangeObscure extends RegisterDiskTopState {}
