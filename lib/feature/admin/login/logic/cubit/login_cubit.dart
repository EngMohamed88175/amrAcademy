import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/function/dialoge_error.dart';
import 'package:schoolacademy/feature/admin/login/data/repository/login_repository.dart';

part 'login_state.dart';

class LoginAdminCubit extends Cubit<LoginAdminState> {
  LoginAdminCubit() : super(LoginInitial());

  final LoginRepository loginRepository = LoginRepository();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final TextEditingController emailAdminController = TextEditingController();
  final TextEditingController passwordAdminController = TextEditingController();

  bool isObscurePassword = true;
  void changeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    emit(ChangeObscurePasswordState());
  }

  // Future<void> login({required BuildContext context}) async {
  //   emit(LoginLoading());

  //   if (!loginKey.currentState!.validate()) return;

  //   final loginModel = LoginModel(
  //       email: emailAdminController.text, password: passwordAdminController.text);

  //   final reuslt = await loginRepository.loginUser(loginModel: loginModel);

  //   reuslt.fold((error) {
  //     emit(LoginFailed());

  //     showMessage(context, error.message, isError: true);
  //     emailAdminController.clear();
  //     passwordAdminController.clear();
  //   }, (sucess) {
  //     showMessage(context, 'تم تسجيل الدخول بنجاح', isError: false,
  //         onConfimTapped: () {
  //       context.pushNamed(Routes.homeScreenDeskTop);
  //     });
  //   });
  // }

  loginAdmin(BuildContext context) {
    FirebaseFirestore.instance.collection("Admin").get().then((snapShot) {
      for (var result in snapShot.docs) {
        if (result.data()['id'] != emailAdminController.text.trim()) {
          showMessage(context, "You id is not correct", isError: true);
        } else if (result.data()['password'] !=
            passwordAdminController.text.trim()) {
          showMessage(context, "You password is not correct", isError: true);
        } else {
          context.pushNamedAndRemoveUntil(Routes.addQuizScreen,
              predicate: (Route<dynamic> route) {
            return false;
          });
        }
      }
    });
  }

  @override
  Future<void> close() {
    emailAdminController.dispose();
    passwordAdminController.dispose();
    return super.close();
  }
}
