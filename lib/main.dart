import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:schoolacademy/academy_school.dart';
import 'package:schoolacademy/core/Routes/app_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:schoolacademy/core/utils/dependency/get_it.dart';
import 'package:schoolacademy/core/utils/helper/cash_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // إعداد URL Strategy للويب
  setUrlStrategy(null);

  // تهيئة Firebase للويب
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBN6OWyo88iVVTNz1-id3NKy_DU7_j4xdY",
        appId: "1:681706658917:web:b86b62c845356c44ce3a8c",
        messagingSenderId: "681706658917",
        projectId: "scoolacademy-68b1a",
        storageBucket: "scoolacademy-68b1a.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // إعداد GetIt للتطبيق
  setupGetIt();

  // تهيئة CacheHelper
  await GetIt.I<CacheHelper>().init();

  // تشغيل التطبيق
  runApp(AmrAcademy(appRouter: AppRouter()));
}
