import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';
import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;
import 'package:schoolacademy/feature/dash_board/home/data/repository/grid_detailes_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeRepository repository = HomeRepository();

  Map<String, int> selectedIndices = {};
  final ScrollController scrollController = ScrollController();
  String selectedRoute = '';

  final List<String> primaryGrades = [
    'امتحان الصف الرابع الإبتدائي',
    'امتحان الصف الخامس الإبتدائي',
    'امتحان الصف السادس الإبتدائي',
    'امتحان الصف الأول الإبتدائي',
    'امتحان الصف الثاني الإبتدائي',
    'امتحان الصف الثالث الإبتدائي',
  ].reversed.toList();

  final List<String> preparatoryGrades = [
    'امتحان الصف الأول الإعدادي',
    'امتحان الصف الثاني الإعدادي',
    'امتحان الصف الثالث الإعدادي',
  ].reversed.toList();

  void navigateTo(BuildContext context, String route) {
    switch (route) {
      case 'home':
        scrollToTop();
        break;
      case 'exams':
        context.pushNamed(Routes.examScreen);
        break;
      case 'courses':
        _scrollToBottom();
        break;
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void selectGrade(BuildContext context, String stage, int index,
      List<ClassesGradePrimaryModel> classGrades) {
    selectedIndices[stage] = index;

    final selectedClass = classGrades[index];

    Navigator.pushNamed(
      context,
      Routes.gradeDetailesScreen,
      arguments: selectedClass,
    );

    emit(HomeGradeSelected(stage: stage, selectedGradeIndex: index));
  }

  bool isGradeSelected(String stage, int index) {
    return selectedIndices[stage] == index;
  }

  // Fetch both classes and books concurrently
  Future<void> fetchInitialData() async {
    emit(HomeLoading());

    try {
      final primaryClassesResult = await repository.fetchClasses('grade');
      final preparatoryClassesResult =
          await repository.fetchClasses('preparatory');
      final booksResult = await repository.fetchNameGridBooks('book');

      primaryClassesResult.fold(
        (failure) => emit(HomeError(failure.message)),
        (primaryClasses) {
          preparatoryClassesResult.fold(
            (failure) => emit(HomeError(failure.message)),
            (preparatoryClasses) {
              booksResult.fold(
                (failure) => emit(HomeError(failure.message)),
                (books) {
                  emit(HomeLoaded(
                    primaryClasses: primaryClasses,
                    preparatoryClasses: preparatoryClasses,
                    books: books,
                  ));
                },
              );
            },
          );
        },
      );
    } catch (error) {
      emit(HomeError("An error occurred while loading data: $error"));
    }
  }

  void openWhatsApp() async {
    const String phoneNumber = "01092853127";
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      // debugPrint("لا يمكن فتح واتساب");
    }
  }
}
