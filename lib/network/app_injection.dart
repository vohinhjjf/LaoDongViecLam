import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/shared_preferences/spref_app_model.dart';
import '../services/api/auth_services.dart';
import '../services/api/sync_services.dart';
import '../services/sqlite/db_provider.dart';
import '../services/sqlite/execute_database.dart';



final getIt = GetIt.instance; //khai báo thư viện get_it ở pubspec.yaml

Future<void> appInjection() async {
  // TODO: đăng kí các dependency ở đây
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<SPrefAppModel>(() {
    final sPrefAppModel = SPrefAppModel.instance;
    sPrefAppModel.onInit();
    return sPrefAppModel;
  });
  getIt.registerLazySingleton<AuthServices>(
      () => AuthServices(getIt.get<Dio>()));
  getIt.registerLazySingleton<SyncServices>(
      () => SyncServices(getIt.get<Dio>()));
  getIt.registerLazySingleton<DbProvider>(() => DbProvider.db);
  getIt.registerLazySingleton<ExecuteDatabase>(
      () => ExecuteDatabase(getIt.get<DbProvider>()));
  //Lazy-singleton: được khởi tạo vào lần gọi lấy instance đầu tiên, chứ không phải khi app khởi động
  //Ví dụ như khi mất wifi, user sẽ không cần gọi api, dẫn đến không cần instance network.
  //Chỉ khi user có wifi, api được gọi lần đầu tiên thì instance được khởi tạo và sử dụng bình thường
}
