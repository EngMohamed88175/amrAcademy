import 'package:get_it/get_it.dart';
import 'package:schoolacademy/core/utils/helper/cash_helper.dart';
import 'package:schoolacademy/core/utils/firebase/firebase_instanced.dart';


final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register SecureStorageHelper


  getIt.registerLazySingleton<FireBaseInstance>(() => FireBaseInstance());
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Register DioConsumer directly
  
}
