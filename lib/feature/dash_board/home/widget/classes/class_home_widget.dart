import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/exam/widget/header_exam.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
import 'package:schoolacademy/feature/dash_board/home/logic/cubit/home_cubit.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/grade_dride_widegt.dart';

class ClassesHomeWidget extends StatelessWidget {
  const ClassesHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Column(
            children: [
              HeaderExam(
                text: 'الأبتدائية',
                colortext2: ChangeTheme.isDarkMode(context)
                    ? ColorsManger.white
                    : ColorsManger.black,
              ),
              SizedBox(height: 5.h),
              GradeGridWidget(
                stage: "primaryStage",
                classes: state.primaryClasses,
                path: "assets/images/jpg/classes1.jpg",
              ),
              SizedBox(height: 5.h),
              HeaderExam(
                text: 'الأعدادية',
                colortext2: ChangeTheme.isDarkMode(context)
                    ? ColorsManger.white
                    : ColorsManger.black,
              ),
              GradeGridWidget(
                stage: "preparatoryStage",
                classes: state.preparatoryClasses,
                path: "assets/images/jpg/classes2.jpg",
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
