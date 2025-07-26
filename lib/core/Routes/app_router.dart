import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/feature/admin/add_quiz/ui/add_quiz.dart';
import 'package:schoolacademy/feature/dash_board/video/video_screen.dart';
import 'package:schoolacademy/feature/dash_board/exam/ui/exam_screen.dart';
import 'package:schoolacademy/feature/dash_board/home/ui/home_screen.dart';
import 'package:schoolacademy/feature/admin/login/ui/login_screen_admin.dart';
import 'package:schoolacademy/feature/dash_board/exam/logic/cubit/exam_cubit.dart';
import 'package:schoolacademy/feature/dash_board/books_screen/ui/books_screen.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/logic/cubit/login_cubit.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/ui/questions_screen.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/ui/login_screen_desk_top.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/logic/cubit/register_cubit.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/ui/register_screen_desk_top.dart';
import 'package:schoolacademy/feature/dash_board/grid_detiales_screen/ui/grade_detailes_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      // case Routes.dashBoradView:
      //   return MaterialPageRoute(builder: (_) => const DashBoradView());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginDeskTopCubit(),
                  child: const LoginScreen(),
                ));

      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterDeskTopCubit(),
                  child: const RegisterScreenDeskTop(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreenDesktop());

      case Routes.examScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ExamCubit(),
                  child: const ExamScreen(),
                ));

      case Routes.questionScreen:
        argument as String;
        return MaterialPageRoute(
            builder: (_) => QuestionScreen(
                  category: argument,
                ));

      case Routes.adminLoginScreen:
        return MaterialPageRoute(builder: (_) => const AdminLoginScreen());

      case Routes.addQuizScreen:
        return MaterialPageRoute(builder: (_) => const AddQuizScreen());

      case Routes.gradeDetailesScreen:
        final classModel = argument as ClassesGradePrimaryModel;
        return MaterialPageRoute(
          builder: (_) => GradeDetailesScreen(
            classModel: classModel,
          ),
        );

      case Routes.booksScreen:
        final classModel = argument as BookScoolGradeModel;
        return MaterialPageRoute(
          builder: (_) => BooksScreen(
            bookScoolGrade: classModel,
          ),
        );
      case Routes.video:
        final args = argument as List<String>; // ✅ استخراج كـ List<String>
        final videoUrl = args[0]; // ✅ الحصول على الفيديو
        final description = args[1]; // ✅ الحصول على اسم الصف
        return MaterialPageRoute(
          builder: (_) => VideoScreen(
            videoUrl: videoUrl,
            description: description,
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
