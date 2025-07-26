import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/logic/cubit/login_cubit.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/widget/desktop_login_layout.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/widget/mobile_tablet_login_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenType(MediaQuery.of(context));

    return BlocProvider(
      create: (context) => LoginDeskTopCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManger.mainColor,
                ColorsManger.primaryColor,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
              child: screenType == DeviceScreenType.desktop
                  ? const DesktopLoginLayout()
                  : const MobileTabletLoginLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
