import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/feature/admin/login/logic/cubit/login_cubit.dart';
import 'package:schoolacademy/feature/admin/login/widget/header_info_admin_widget.dart';
import 'package:schoolacademy/feature/admin/login/widget/button_auth_admin_widget.dart';
import 'package:schoolacademy/feature/admin/login/widget/login_auth_form_admin_widgetd.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginAdminCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image at the bottom layer
            Positioned.fill(
              child: Image.asset(
                ImageAssetsManger.backgroundTwo,
                fit: BoxFit.cover,
              ),
            ),
            // Main content (top child)
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 100),

                          /// Header info
                          AdminHeaderInfoWidget(
                            title: ' Amr Academy ',
                            description: ' سجل الدخول الي منصة ',
                            style: StylesManager.styleBold30(context),
                            styleTwo: StylesManager.styleBold30(context)
                                .copyWith(color: ColorsManger.white),
                          ),

                          Text("أهلا بك! سجل الدخول الي حسابك ",
                              style: StylesManager.style22Bold(context)),

                          const SizedBox(height: 50),

                          /// Login form
                          const AdminLoginFormWidget(),

                          ///
                          const SizedBox(height: 20),

                          /// Create account button
                          AdminButtonAuthAdminWidget(
                            text: ' ليس لديك حساب؟ ',
                            hintText: "انشاء حسابك الأن",
                            isText: true,
                            onTap: () {
                              context.pushNamed(Routes.registerScreen);
                            },
                            isOnTap: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
