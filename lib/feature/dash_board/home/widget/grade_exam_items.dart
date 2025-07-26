import 'package:flutter/material.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class GradeExamItemsStudent extends StatelessWidget {
  final String gradeTitle;
  final String stage;
  final ClassesGradePrimaryModel classData;
  final String path;
  const GradeExamItemsStudent({
    super.key,
    required this.gradeTitle,
    required this.stage,
    required this.classData,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: stv(
              context: context, mobile: 30.sp, tablet: 15.sp, desktop: 15.sp)),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.gradeDetailesScreen,
            arguments: classData,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.sp),
              ),
              child: AppImageHelper(
                path: path,
                fit: BoxFit.cover,
                width: double.infinity,
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
                      color: ColorsManger.black,
                      fontSize: stv(
                          context: context,
                          mobile: 20.sp,
                          tablet: 16.sp,
                          desktop: 14.sp),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
