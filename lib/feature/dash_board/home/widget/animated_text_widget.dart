import 'package:flutter/material.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/header_image.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // تهيئة AnimationController مع مدة زمنية
    _animationController = AnimationController(
      duration: Duration(seconds: 1), // مدة الأنيميشن
      vsync: this,
    )..repeat(reverse: true); // تكرار الأنيميشن

    // تحديد حركة الأنيميشن من 0 إلى 10 (للتحرك للأعلى والأسفل)
    _animation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final deviceType = getScreenType(MediaQuery.of(context));

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (deviceType ==
                  DeviceScreenType
                      .desktop) // إذا كانت الشاشة أكبر من الموبايل أو التابلت (ويب أو ديسكتوب)
                Row(
                  children: [
                    Expanded(
                        child: HeaderImage(path: "assets/images/png/main.png")),
                    // استخدم AnimatedBuilder على كلمة "عمرو" فقط
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                                0,
                                _animation
                                    .value), // تحريك الكلمة للأعلى والأسفل
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'منصة ',
                                    style: TextStyle(
                                      color: ChangeTheme.isDarkMode(context)
                                          ? ColorsManger.white
                                          : ColorsManger.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // كلمة "عمرو" تتحرك هنا
                                  TextSpan(
                                    text: 'الــعـــــــــــــــارف\n',
                                    style: TextStyle(
                                      fontSize:
                                          22.sp, // الحجم الكبير لكلمة "عمرو"
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManger
                                          .primaryColor, // اللون الخاص بـ "عمرو"
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'منصة متكاملة بها كل ما يحتاجه الطالب ليتفوق',
                                    style: StylesManager.styleBold30(context)
                                        .copyWith(
                                      color: ChangeTheme.isDarkMode(context)
                                          ? ColorsManger.white
                                          : ColorsManger.black,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign:
                                  TextAlign.center, // لضبط النص في المنتصف
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              if (deviceType !=
                  DeviceScreenType.desktop) // إذا كانت الشاشة موبايل أو تابلت
                Column(
                  children: [
                    HeaderImage(path: "assets/images/png/main.png"),
                    SizedBox(height: 5.h), // فاصل بين الصورة والنص
                    // استخدم AnimatedBuilder على كلمة "عمرو" فقط
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0,
                              _animation.value), // تحريك الكلمة للأعلى والأسفل
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'منصة ',
                                  style: TextStyle(
                                    color: ChangeTheme.isDarkMode(context)
                                        ? ColorsManger.white
                                        : ColorsManger.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // كلمة "عمرو" تتحرك هنا
                                TextSpan(
                                  text: 'الــعـــــــــــــــارف\n',
                                  style: TextStyle(
                                    fontSize: stv(
                                        context: context,
                                        mobile: 22.sp,
                                        tablet: 22.sp,
                                        desktop:
                                            null), // الحجم الكبير لكلمة "عمرو"
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManger
                                        .primaryColor, // اللون الخاص بـ "عمرو"
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'منصة متكاملة بها كل ما يحتاجه الطالب ليتفوق',
                                  style: StylesManager.styleBold30(context)
                                      .copyWith(
                                    color: ChangeTheme.isDarkMode(context)
                                        ? ColorsManger.white
                                        : ColorsManger.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center, // لضبط النص في المنتصف
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
