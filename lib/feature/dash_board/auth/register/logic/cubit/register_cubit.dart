import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/function/dialoge_error.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/data/model/user_model.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/data/repository/register_repository.dart';

part 'register_state.dart';

class RegisterDeskTopCubit extends Cubit<RegisterDiskTopState> {
  RegisterDeskTopCubit() : super(RegisterInitial());

  final RegisterRepository registerRepository = RegisterRepository();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  final TextEditingController userNameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController countryCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  bool isObscure = true;

  void changeObscure() {
    isObscure = !isObscure;
    emit(ChangeObscure());
  }

  Future<void> register({
    required BuildContext context,
  }) async {
    if (!registerKey.currentState!.validate()) return;

    emit(RegisterLoding());

    final userModel = UserModel(
        username: userNameCont.text.trim(),
        email: emailCont.text.trim(),
        phone: phoneCont.text.trim(),
        country: countryCont.text.trim(),
        password: passwordCont.text.trim());

    final reuslt = await registerRepository.registeruser(userModel: userModel);

    reuslt.fold((error) {
      emit(RegisterFailed());

      showMessage(context, error.message, isError: true);
      clearController();
    }, (sucess) {
      emit(RegisterLoaded());
      showMessage(context, 'تم التسجيل بنجاح ', isError: false,
          onConfimTapped: () {
        context.pushNamed(Routes.loginScreen);
      });
    });
  }

  void clearController() {
    userNameCont.clear();
    emailCont.clear();
    countryCont.clear();
    phoneCont.clear();
    passwordCont.clear();
  }

  @override
  Future<void> close() {
    userNameCont.dispose();
    emailCont.dispose();
    countryCont.dispose();
    phoneCont.dispose();
    passwordCont.dispose();

    return super.close();
  }
}
