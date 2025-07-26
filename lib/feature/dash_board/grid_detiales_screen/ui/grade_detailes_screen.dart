import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
import 'package:schoolacademy/feature/dash_board/grid_detiales_screen/widget/my_card_item.dart';
import 'package:schoolacademy/feature/dash_board/grid_detiales_screen/logic/cubit/grid_detailes_cubit.dart';
import 'package:schoolacademy/feature/dash_board/grid_detiales_screen/widget/header_grade_detiles_widget.dart';

class GradeDetailesScreen extends StatelessWidget {
  final ClassesGradePrimaryModel classModel;

  const GradeDetailesScreen({super.key, required this.classModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GridDetailesCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // عنوان الصفحة بتصميم جذاب
                HeaderGradeDetailesWidget(classModel: classModel),

                // الفاصل
                SliverToBoxAdapter(child: SizedBox(height: 5.h)),

                // شبكة البطاقات المحسنة
                BlocBuilder<GridDetailesCubit, GridDetailesState>(
                  builder: (context, state) {
                    List<int> indicesToShow = [];

                    if (state is GridDetailesSearchState) {
                      indicesToShow = state.filteredIndices;
                    } else {
                      indicesToShow =
                          List.generate(classModel.id.length, (index) => index);
                    }

                    // ✅ تحقق مما إذا كانت القائمة فارغة وعرض رسالة بدلاً من الشبكة
                    if (indicesToShow.isEmpty) {
                      return SliverToBoxAdapter(
                          child: const Center(
                              child: AppImageHelper(
                                  path: "assets/images/json/empty_exam.json")));
                    }

                    return SliverPadding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: stv(
                              context: context,
                              mobile: 1,
                              tablet: 2,
                              desktop: 3),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 550,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final lessonIndex = indicesToShow[index];

                            return MyCardItem(
                              description: classModel.descriptions[lessonIndex],
                              nameTeacher: classModel.nameTeacher[lessonIndex],
                              imageUrl: classModel.image[lessonIndex],
                              videoUrl: classModel.videoUrl[lessonIndex],
                              nameGrade: classModel.nameGrade,
                            );
                          },
                          childCount: indicesToShow.length,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              top: 5.h,
              left: 2.w,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18.sp,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
