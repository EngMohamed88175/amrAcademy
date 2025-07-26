import 'exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());

  final ScrollController scrollController = ScrollController();
  String selectedRoute = '';

  final List<String> primaryGrades = [
    'إمتحان الصف الرابع الإبتدائي',
    'إمتحان الصف الخامس الإبتدائي',
    'إمتحان الصف السادس الإبتدائي',
    'إمتحان الصف الأول الإبتدائي',
    'إمتحان الصف الثاني الإبتدائي',
    'إمتحان الصف الثالث الإبتدائي',
  ].reversed.toList();

  final List<String> primaryGradesMobile = [
    'إمتحان الصف الأول الإبتدائي',
    'إمتحان الصف الثاني الإبتدائي',
    'إمتحان الصف الثالث الإبتدائي',
    'إمتحان الصف الرابع الإبتدائي',
    'إمتحان الصف الخامس الإبتدائي',
    'إمتحان الصف السادس الإبتدائي',
  ];

  final List<String> preparatoryGrades = [
    'إمتحان الصف الأول الإعدادي',
    'إمتحان الصف الثاني الإعدادي',
    'إمتحان الصف الثالث الإعدادي',
  ].reversed.toList();

  final List<String> preparatoryGradesMobile = [
    'إمتحان الصف الأول الإعدادي',
    'إمتحان الصف الثاني الإعدادي',
    'إمتحان الصف الثالث الإعدادي',
  ];

  void navigateTo(BuildContext context, String route) {
    emit(ExamSuccess(selectedRoute: selectedRoute));

    switch (route) {
      case 'home':
        context.pushNamed(Routes.homeScreen);
        break;
      case 'exams':
        context.pushNamed(Routes.examScreen);
        break;
      case 'courses':
        context.pushNamed(Routes.questionScreen, arguments: 'default');
        break;
    }
  }
}
