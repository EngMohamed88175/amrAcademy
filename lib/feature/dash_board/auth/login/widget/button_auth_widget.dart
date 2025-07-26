import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/logic/cubit/login_cubit.dart';
import 'package:schoolacademy/core/utils/widgets/main_button_local/main_button_locald.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/logic/cubit/register_cubit.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class ButtonAuthDeskTopWidget extends StatelessWidget {
  final bool isText;
  final String text;
  final String hintText;
  final void Function()? onTap;
  final bool isOnTap;
  const ButtonAuthDeskTopWidget({
    super.key,
    required this.isText,
    required this.text,
    required this.hintText,
    required this.onTap,
    required this.isOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButtonLocal(
          backgroundColor: ColorsManger.primaryColor,
          width: 500,
          height: 45,
          borderRadius: 10,
          text: isText == true ? "تسجيل الدخول " : "انشاء حسابك الأن",
          textColor: ColorsManger.white,
          onTap: () {
            if (isOnTap == true) {
              context.read<LoginDeskTopCubit>().login(context: context);
            } else {
              context.read<RegisterDeskTopCubit>().register(context: context);
            }
          },
          isBorder: false,
          isIcon: false,
          fontSizeText: 25,
          fontSizeIcon: 0,
          isIconColor: false,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 500,
            height: 45,
            decoration: BoxDecoration(
              color: ColorsManger.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: text, style: StylesManager.styleBold20(context)),
                    TextSpan(
                        text: hintText,
                        style: StylesManager.styleBold20(context)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
