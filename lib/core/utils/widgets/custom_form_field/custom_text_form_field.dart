import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData iconData;

  final bool expands;
  final bool obscureText;
  final void Function()? onPressed;
  final String? Function(String?) validator;
  final bool isNumber;
  final IconData? suffixIcon;
  final bool isSuffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.isNumber,
    required this.validator,
    required this.iconData,
    this.suffixIcon,
    required this.isSuffixIcon,
    required this.expands,
    required this.obscureText,
    this.controller,
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            scrollPadding: EdgeInsets.zero,
            obscureText: obscureText,
            onChanged: onChanged,
            controller: controller,
            expands: expands,
            style: const TextStyle(
              color: ColorsManger.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: validator,
            decoration: DecorationTextField(context),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  InputDecoration DecorationTextField(BuildContext context) {
    return InputDecoration(
      hintText: labelText,
      hintStyle:
          TextStyle(color: ColorsManger.black, fontWeight: FontWeight.bold),
      prefixIcon: Icon(iconData),
      // labelText: labelText,
      // labelStyle: TextStyle(
      //     color: isDarkMode ? ColorsManger.white : ColorsManger.black),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: ColorsManger.gray),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: ColorsManger.pink),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: ColorsManger.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: ColorsManger.red),
      ),
      fillColor: ColorsManger.white,
      filled: true,
      suffixIcon: isSuffixIcon
          ? InkWell(
              onTap: onPressed,
              child: Icon(suffixIcon),
            )
          : const SizedBox.shrink(),
    );
  }
}
