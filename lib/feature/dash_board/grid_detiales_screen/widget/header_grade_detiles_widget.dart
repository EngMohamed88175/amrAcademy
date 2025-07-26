import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
import 'package:schoolacademy/feature/dash_board/grid_detiales_screen/logic/cubit/grid_detailes_cubit.dart';

class HeaderGradeDetailesWidget extends StatelessWidget {
  const HeaderGradeDetailesWidget({
    super.key,
    required this.classModel,
  });

  final ClassesGradePrimaryModel classModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GridDetailesCubit>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            // بطاقة العنوان الأساسية بتأثير زجاجي
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade900, Colors.blue.shade500],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // صورة رمزية دائرية للمرحلة
                          CircleAvatar(
                            radius: stv(
                                context: context,
                                mobile: 10.h,
                                tablet: 18.h,
                                desktop: 15.h),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: Icon(Icons.school,
                                size: stv(
                                    context: context,
                                    mobile: 10.h,
                                    tablet: 18.h,
                                    desktop: 15.h),
                                color: ColorsManger.white),
                          ),

                          // عنوان المرحلة الدراسية
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  classModel.nameGrade,
                                  style: StylesManager.style55Bold(context)
                                      .copyWith(
                                    fontSize: stv(
                                        context: context,
                                        mobile: 18.sp,
                                        desktop: 18.sp,
                                        tablet: 20.sp),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  textAlign: TextAlign.center,
                                  "مرحلة دراسية متكاملة",
                                  style: TextStyle(
                                    color: ColorsManger.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // مربع البحث داخل البطاقة (دائم الظهور)
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: TextField(
                          style: TextStyle(
                            color: ColorsManger.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "ابحث عن درس...",
                            hintStyle: TextStyle(
                              color: ColorsManger.black,
                            ),
                            prefixIcon: Icon(Icons.search, color: Colors.blue),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            cubit.searchLessons(value, classModel.descriptions);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // عنصر إحصائي فوق البطاقة
                Positioned(
                  right: 5.w,
                  bottom: -5.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: Row(
                        children: [
                          Icon(Icons.play_circle_fill,
                              color: Colors.blueAccent, size: 7.h),
                          SizedBox(width: 3.w),
                          Text(
                            "${classModel.videoUrl.length} الدروس المتاحة",
                            style: TextStyle(
                              fontSize: stv(
                                  context: context,
                                  mobile: 16.sp,
                                  tablet: 16.sp,
                                  desktop: 14.sp),
                              fontWeight: FontWeight.w600,
                              color: ColorsManger.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
