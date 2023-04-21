import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/screens/changePass/change_pass_viewmodel.dart';

import 'components/navigation/navigation_service.dart';
import 'data/shared_preferences/spref_app_model.dart';
import 'models/route_observe_model.dart';
import 'network/app_injection.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home/home_viewmodel.dart';
import 'screens/interview/area/area_viewmodel.dart';
import 'screens/interview/status/interview_status/interview_status_viewmodel.dart';
import 'screens/login/login_viewmodel.dart';
import 'screens/progress/progress_viewmodel.dart';
import 'services/api/auth_services.dart';
import 'services/api/sync_services.dart';
import 'services/sqlite/execute_database.dart';

void main() async {
  appInjection(); //gọi hàm vừa tạo ở app_injection.dart trước khi render UI

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(getIt.get<AuthServices>(),
              getIt.get<SPrefAppModel>(),getIt.get<ExecuteDatabase>()),
          lazy: true,
        ),
        ChangeNotifierProvider(
            create: (_) => HomeViewModel(getIt.get<SyncServices>(),
                getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => ChangePasswordViewModel(getIt.get<SyncServices>(),
                getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => ProgressViewModel(getIt.get<SyncServices>(),
                getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => AreaViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => InterviewStatusViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          onGenerateRoute: NavigationServices.instance.routeBuilders,
          navigatorObservers: [RouteObserverModel.topRouteObserver()],
        );
      },
    );
  }
}
