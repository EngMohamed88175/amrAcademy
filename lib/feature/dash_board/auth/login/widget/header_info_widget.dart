import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';

class HeaderInfoWidget extends StatelessWidget {
  const HeaderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.menu_book_rounded, // أيقونة الكتاب
          size: 20.h,
          color: ColorsManger.white, // يمكنك تغيير اللون حسب التصميم
        ),
        const SizedBox(height: 16),
        Text(
          'أل عارف',
          style: StylesManager.styleBold30(context)
              .copyWith(color: ColorsManger.white),
        ),
      ],
    );
  }
}
