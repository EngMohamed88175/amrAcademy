import 'package:flutter/material.dart';
import 'package:screen_go/screen_go.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:schoolacademy/core/Routes/app_router.dart';
import 'package:schoolacademy/core/utils/theme/Theme_data.dart';
import 'package:schoolacademy/core/utils/cubit/theme_cubit.dart';

class AmrAcademy extends StatelessWidget {
  final AppRouter appRouter;
  const AmrAcademy({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenGo(
      materialApp: true,
      builder: (context, deviceInfo) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final appCubit = context.read<ThemeCubit>();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Amr Academy',
                initialRoute: FirebaseAuth.instance.currentUser != null
                    ? Routes.homeScreen
                    : Routes.loginScreen,
                themeMode: appCubit.loadThemeMode(),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                onGenerateRoute: appRouter.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
