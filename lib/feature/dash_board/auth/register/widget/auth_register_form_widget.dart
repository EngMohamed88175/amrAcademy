import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/utils/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/logic/cubit/register_cubit.dart';

class AuthRegister extends StatelessWidget {
  const AuthRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterDeskTopCubit, RegisterDiskTopState>(
      builder: (context, state) {
        final cubit = context.read<RegisterDeskTopCubit>();
        return SizedBox(
          width: 500,
          child: Form(
            key: cubit.registerKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "أدخل أسمك",
                  obscureText: false,
                  controller: cubit.userNameCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Icons.person,
                  isSuffixIcon: true,
                  expands: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  labelText: "أدخل الأيميل الألكتروني",
                  obscureText: false,
                  controller: cubit.emailCont,
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
                  labelText: "أدخل رقم الهاتف الخاص بك ",
                  obscureText: false,
                  controller: cubit.phoneCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Icons.phone,
                  isSuffixIcon: true,
                  expands: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  labelText: "أدخل الدولة المقيم بها ",
                  obscureText: false,
                  controller: cubit.countryCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Iconsax.location,
                  isSuffixIcon: true,
                  expands: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  labelText: "أدخل كلمة المرور",
                  obscureText: cubit.isObscure,
                  controller: cubit.passwordCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  isNumber: false,
                  iconData: Iconsax.password_check,
                  suffixIcon: cubit.isObscure ? Iconsax.eye : Iconsax.eye_slash,
                  isSuffixIcon: true,
                  expands: false,
                  onPressed: () {
                    cubit.changeObscure();
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
