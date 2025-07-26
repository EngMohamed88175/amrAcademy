import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/widget/button_auth_widget.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/widget/auth_register_form_widget.dart';

/// **بطاقة تسجيل الحساب**
class RegisterCardWidget extends StatelessWidget {
  const RegisterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: ColorsManger.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "إنشاء حساب",
                style: StylesManager.style22Bold(context).copyWith(
                    color: ColorsManger.primaryColor, fontSize: 16.sp),
              ),
              SizedBox(height: 5.h),
              const AuthRegister(),
              SizedBox(height: 2.h),
              ButtonAuthDeskTopWidget(
                text: "هل لديك حساب؟",
                hintText: "تسجيل الدخول",
                isText: true,
                onTap: () {
                  context.pop();
                },
                isOnTap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
