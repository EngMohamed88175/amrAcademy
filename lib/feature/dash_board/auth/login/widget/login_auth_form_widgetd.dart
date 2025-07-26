import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/logic/cubit/login_cubit.dart';
import 'package:schoolacademy/core/utils/widgets/custom_form_field/custom_text_form_field.dart';

class AuthLoginFormWidget extends StatelessWidget {
  const AuthLoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginDeskTopCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginDeskTopCubit>();
        return SizedBox(
          width: 500,
          child: Form(
            key: cubit.loginKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "أدخل البريد الألكتروني",
                  obscureText: false,
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Icons.email_outlined,
                  isSuffixIcon: true,
                  expands: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  
                  labelText: "أدخل كلمة المرور",
                  obscureText: cubit.isObscurePassword,
                  controller: cubit.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Iconsax.password_check,
                  suffixIcon: cubit.isObscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  isSuffixIcon: true,
                  expands: false,
                  onPressed: () {
                    cubit.changeObscurePassword();
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
