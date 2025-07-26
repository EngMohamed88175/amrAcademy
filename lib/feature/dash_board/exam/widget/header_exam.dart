import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';

class HeaderExam extends StatelessWidget {
  final String text;
  final Color colortext2;
  const HeaderExam({
    super.key,
    required this.text,
    required this.colortext2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: " الصفوف",
              style: StylesManager.styleBold30(context).copyWith(
                color: ColorsManger.primaryColor,
                fontSize: 35,
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 1.w),
            ),
            TextSpan(
              text: text,
              style: StylesManager.styleBold30(context).copyWith(
                color: colortext2,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
