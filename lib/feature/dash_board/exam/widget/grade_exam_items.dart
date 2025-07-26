import 'package:flutter/material.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class GradeExamItems extends StatelessWidget {
  final String gradeTitle;
  final String teacher = "Amr Aref";
  final bool isGrade;

  const GradeExamItems({
    super.key,
    required this.gradeTitle,
    required this.isGrade,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: stv(
              context: context, mobile: 30.sp, tablet: 15.sp, desktop: 15.sp)),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.questionScreen, arguments: gradeTitle);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: AppImageHelper(
                path: isGrade
                    ? "assets/images/jpg/classes3.jpg"
                    : "assets/images/jpg/classes2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManger.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.sp),
                    bottomRight: Radius.circular(16.sp),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    gradeTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: stv(
                          context: context,
                          mobile: 18.sp,
                          tablet: 14.sp,
                          desktop: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
