import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/utils/dependency/get_it.dart';
import 'package:schoolacademy/core/utils/helper/cash_helper.dart';



part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
     setCurrentTheme();
  }


   static const String themeKey = 'theme_mode';

  Offset initialPosition = const Offset(250, 0);
  Offset switchPosition = const Offset(350, 350);
  Offset containerPosition = const Offset(350, 350);
  Offset finalPosition = const Offset(350, 350);

  late bool isLigthTheme;

  bool isDarkMode() {
    final themeString = getIt<CacheHelper>().getDataString(key: themeKey);
    return themeString == 'dark';
  }
  ThemeMode loadThemeMode() {
    final themeString = getIt<CacheHelper>().getDataString(key: themeKey);
    if (themeString == 'light') {
      return ThemeMode.light;
    } else if (themeString == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void setCurrentTheme() {
    isLigthTheme = loadThemeMode() == ThemeMode.light;
  }

  void toggleTheme() {
    final newTheme =
        getIt<CacheHelper>().getDataString(key: themeKey) == 'light'
            ? 'dark'
            : 'light';
    emit(ThemeInitial());
    getIt<CacheHelper>().saveData(key: themeKey, value: newTheme);
  }

  void setTheme(ThemeMode themeMode) {
    emit(ThemeInitial());
    getIt<CacheHelper>()
        .saveData(key: themeKey, value: themeMode.toString().split('.').last);
  }
 void initializePositions(Size size) {
    initialPosition = Offset(size.width * .9, 0);

    /// check if theme is dark or light
    if (loadThemeMode() == ThemeMode.light) {
      // Light theme-specific logic
      containerPosition = Offset(size.width * .9, size.height * .4);
      finalPosition =
          Offset(size.width * .9, size.height * .5 - size.width * .1);
    } else {
      // Dark theme-specific logic
      containerPosition = Offset(size.width * .8, size.height * .45);
      finalPosition =
          Offset(size.width * .8, size.height * .55 - size.width * .1);
    }
  }
}
