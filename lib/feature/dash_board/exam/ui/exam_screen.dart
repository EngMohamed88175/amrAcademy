import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/widgets/custom_app_bar.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/wave_footer.dart';
import 'package:schoolacademy/feature/dash_board/exam/widget/header_exam.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
import 'package:schoolacademy/feature/dash_board/exam/logic/cubit/exam_cubit.dart';
import 'package:schoolacademy/feature/dash_board/exam/widget/grade_exam_items.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: context.read<ExamCubit>().scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBar(
              selectedRoute: context.read<ExamCubit>().selectedRoute,
              onNavigate: context.read<ExamCubit>().navigateTo,
            ),
          ),
          SliverToBoxAdapter(
            child: HeaderExam(
              colortext2: ChangeTheme.isDarkMode(context)
                  ? ColorsManger.white
                  : ColorsManger.black,
              text: 'الأبتدائية',
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  stv(context: context, mobile: 1, tablet: 2, desktop: 3),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GradeExamItems(
                  gradeTitle: getScreenType(MediaQuery.of(context)) ==
                          DeviceScreenType.desktop
                      ? context.read<ExamCubit>().primaryGrades[index]
                      : context.read<ExamCubit>().primaryGradesMobile[index],
                  isGrade: true,
                );
              },
              childCount: context.read<ExamCubit>().primaryGrades.length,
            ),
          ),
          SliverToBoxAdapter(
            child: HeaderExam(
              text: 'الأعدادية',
              colortext2: ChangeTheme.isDarkMode(context)
                  ? ColorsManger.white
                  : ColorsManger.black,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  stv(context: context, mobile: 1, tablet: 2, desktop: 3),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GradeExamItems(
                  gradeTitle: getScreenType(MediaQuery.of(context)) ==
                          DeviceScreenType.desktop
                      ? context.read<ExamCubit>().preparatoryGrades[index]
                      : context
                          .read<ExamCubit>()
                          .preparatoryGradesMobile[index],
                  isGrade: false,
                );
              },
              childCount: context.read<ExamCubit>().preparatoryGrades.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0.h,
              child: Stack(
                children: [
                  WaveFooter(
                    text: "منصة مستر عمرو عارف 2025 جميع الحقوق محفوظة ©",
                    title: "Developed by: ",
                    subTitle: "Eng.MohamedKhaled",
                    styleOne: StylesManager.style30Almarai(context).copyWith(
                      color: ChangeTheme.isDarkMode(context)
                          ? ColorsManger.white
                          : ColorsManger.black,
                    ),
                    styleTwo:
                        StylesManager.style25PlayfairDisplay(context).copyWith(
                      color: ChangeTheme.isDarkMode(context)
                          ? ColorsManger.white
                          : ColorsManger.black,
                    ),
                    styleThree:
                        StylesManager.style25PlayfairDisplay(context).copyWith(
                      color: ChangeTheme.isDarkMode(context)
                          ? ColorsManger.white
                          : ColorsManger.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
