import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/cubit/theme_cubit.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({super.key});

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final screenType = getScreenType(MediaQuery.of(context));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الإيميل
          Expanded(
            child: Text(
              "Email : ${user?.email ?? 'user@example.com'}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: ChangeTheme.isDarkMode(context) ? ColorsManger.white : ColorsManger.black,
              ),
            ),
          ),

          // النص في المنتصف
          Expanded(
            child: Center(
              child: Text(
                'مرحباً بك',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),

          // الأزرار
          if (screenType == DeviceScreenType.desktop)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // لتجنب التمدد غير الضروري
                children: [
                  // زر تغيير الثيم
                  InkWell(
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: ChangeTheme.isDarkMode(context)
                              ? Colors.blueAccent
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              ChangeTheme.isDarkMode(context) ? Icons.light_mode : Icons.dark_mode,
                              color: ColorsManger.white,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              ChangeTheme.isDarkMode(context) ? 'الوضع الفاتح' : 'الوضع الداكن',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManger.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 3.w),

                  // زر الاختبارات
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.examScreen);
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: isHovered
                                ? Colors
                                      .red // Neon Pink on hover
                                : const Color(0xFF00FF00).withOpacity(0.8), // Neon Green normally
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: isHovered
                                    ? Colors.pinkAccent.withOpacity(0.5)
                                    : Colors.greenAccent.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'الإختبارات',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManger.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // لتجنب التمدد غير الضروري
                children: [
                  // زر تغيير الثيم
                  InkWell(
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: ChangeTheme.isDarkMode(context)
                              ? Colors.blueAccent
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              ChangeTheme.isDarkMode(context) ? Icons.light_mode : Icons.dark_mode,
                              color: ColorsManger.white,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              ChangeTheme.isDarkMode(context) ? 'الوضع الفاتح' : 'الوضع الداكن',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManger.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),

                  // زر الاختبارات
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.examScreen);
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            color: isHovered
                                ? Colors
                                      .red // Neon Pink on hover
                                : const Color(0xFF00FF00).withOpacity(0.8), // Neon Green normally
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: isHovered
                                    ? Colors.pinkAccent.withOpacity(0.5)
                                    : Colors.greenAccent.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'الاختبارات',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManger.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
