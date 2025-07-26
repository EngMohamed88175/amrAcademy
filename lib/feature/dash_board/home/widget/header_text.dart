import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class HeaderText extends StatelessWidget {
  final String text;
  final String subtText;
  const HeaderText({
    super.key,
    required this.text,
    required this.subtText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: StylesManager.styleBold30(context).copyWith(
                color: ColorsManger.primaryColor,
                fontSize: 22.sp,
              ),
            ),
            TextSpan(
              text: subtText,
              style: StylesManager.styleBold30(context).copyWith(
                fontSize: 22.sp,
                 color: ChangeTheme.isDarkMode(context)
                  ? ColorsManger.white
                  : ColorsManger.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
