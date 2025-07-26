import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/function/dialoge_error.dart';
import 'package:schoolacademy/feature/admin/login/data/model/login_model.dart';
import 'package:schoolacademy/feature/admin/login/data/repository/login_repository.dart';

part 'login_state.dart';

class LoginDeskTopCubit extends Cubit<LoginState> {
  LoginDeskTopCubit() : super(LoginInitial());

  final LoginRepository loginRepository = LoginRepository();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscurePassword = true;
  void changeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    emit(ChangeObscurePasswordState());
  }

  Future<void> login({required BuildContext context}) async {
    emit(LoginLoading());

    if (!loginKey.currentState!.validate()) return;

    final loginModel = LoginModel(
        email: emailController.text, password: passwordController.text);

    final reuslt = await loginRepository.loginUser(loginModel: loginModel);

    reuslt.fold((error) {
      emit(LoginFailed());

      showMessage(context, error.message, isError: true);
      emailController.clear();
      passwordController.clear();
    }, (sucess) {
      showMessage(context, 'تم تسجيل الدخول بنجاح', isError: false,
          onConfimTapped: () {
        context.pushNamed(Routes.homeScreen);
      });
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
