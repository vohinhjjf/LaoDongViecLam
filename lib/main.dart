import 'package:flutter/material.dart';
import 'package:LDVL2024/screens/interview/questions/Person_providing_information/information_provider_viewmodel.dart';
import 'package:LDVL2024/screens/interview/questions/Select_code/P17B/P17B_viewmodel.dart';
import 'package:LDVL2024/screens/interview/questions/Select_code/P56_58/P56_58_viewmodel.dart';
import 'package:LDVL2024/screens/interview/questions/household_information/general_information/general_information_viewmodel.dart';
import 'package:LDVL2024/screens/interview/status/backup/backup_viewmodel.dart';
import 'package:LDVL2024/screens/interview/status/complete_interview/complete_interview_viewmodel.dart';

import 'components/navigation/drawer_navigation/drawer_navigation_model.dart';
import 'components/navigation/navigation_service.dart';
import 'data/shared_preferences/spref_app_model.dart';
import 'models/route_observe_model.dart';
import 'network/app_injection.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/bottom_navigation_bar/bottom_navigation_bar_viewmodel.dart';
import 'screens/changePass/change_pass_viewmodel.dart';
import 'screens/home/home_viewmodel.dart';
import 'screens/interview/area/area_viewmodel.dart';

import 'screens/interview/questions/Finish/finish_viewmodel.dart';
import 'screens/interview/questions/GPS/gps_viewmodel.dart';
import 'screens/interview/questions/Part_1/P01_04/P01_04_viewmodel.dart';
import 'screens/interview/questions/Part_1/P05/P05_viewmodel.dart';
import 'screens/interview/questions/Part_1/P06_07/P06_07_viewmodel.dart';

import 'screens/interview/questions/Part_2/P08_09/P08_09_viewmodel.dart';
import 'screens/interview/questions/Part_2/P10_12/P10_12_viewmodel.dart';
import 'screens/interview/questions/Part_2/P13_14/P13_14_viewmodel.dart';
import 'screens/interview/questions/Part_2/P15/P15_viewmodel.dart';
import 'screens/interview/questions/Part_2/P16/P16_viewmodel.dart';
import 'screens/interview/questions/Part_2/P17/P17_viewmodel.dart';
import 'screens/interview/questions/Part_2/P18/P18_viewmodel.dart';

import 'screens/interview/questions/Part_3/P19/P19_viewmodel.dart';
import 'screens/interview/questions/Part_3/P20_22/P20_22_viewmodel.dart';
import 'screens/interview/questions/Part_3/P23/P23_viewmodel.dart';
import 'screens/interview/questions/Part_3/P24_25/P24_25_viewmodel.dart';
import 'screens/interview/questions/Part_3/P26/P26_viewmodel.dart';
import 'screens/interview/questions/Part_3/P27/P27_viewmodel.dart';
import 'screens/interview/questions/Part_3/P28/P28_viewmodel.dart';
import 'screens/interview/questions/Part_3/P29_30/P29_30_viewmodel.dart';
import 'screens/interview/questions/Part_3/P31_32/P31_32_viewmodel.dart';
import 'screens/interview/questions/Part_3/P33/P33_viewmodel.dart';
import 'screens/interview/questions/Part_3/P34/P34_viewmodel.dart';
import 'screens/interview/questions/Part_3/P35/P35_viewmodel.dart';
import 'screens/interview/questions/Part_3/P36_37/P36_37_viewmodel.dart';
import 'screens/interview/questions/Part_3/P38/P38_viewmodel.dart';

import 'screens/interview/questions/Part_4/P39_42/P39_42_viewmodel.dart';
import 'screens/interview/questions/Part_4/P43/P43_viewmodel.dart';
import 'screens/interview/questions/Part_4/P44_46/P44_46_viewmodel.dart';
import 'screens/interview/questions/Part_4/P47/P47_viewmodel.dart';
import 'screens/interview/questions/Part_4/P48_49/P48_49_viewmodel.dart';
import 'screens/interview/questions/Part_4/P50_51/P50_51_viewmodel.dart';
import 'screens/interview/questions/Part_4/P52_54/P52_54_viewmodel.dart';

import 'screens/interview/questions/Part_5/P55_59/P55_59_viewmodel.dart';
import 'screens/interview/questions/Part_5/P60/P60_viewmodel.dart';
import 'screens/interview/questions/Part_5/P61_62/P61_62_viewmodel.dart';
import 'screens/interview/questions/Part_5/P63_64/P63_64_viewmodel.dart';
import 'screens/interview/questions/Part_5/P65_66/P65_66_viewmodel.dart';
import 'screens/interview/questions/Part_5/P67_68/P67_68_viewmodel.dart';

import 'screens/interview/questions/Part_6/P69/P69_viewmodel.dart';
import 'screens/interview/questions/Part_6/P70_75/P70_75_viewmodel.dart';
import 'screens/interview/questions/Part_7/P76_77/P76_77_viewmodel.dart';
import 'screens/interview/questions/Part_7/P78/P78_viewmodel.dart';
import 'screens/interview/questions/Part_7/P79/P79_viewmodel.dart';
import 'screens/interview/questions/Part_7/P80/P80_viewmodel.dart';
import 'screens/interview/questions/Part_7/P81/P81_viewmodel.dart';
import 'screens/interview/questions/Part_7/P82/P82_viewmodel.dart';
import 'screens/interview/questions/Part_7/P83/P83_viewmodel.dart';
import 'screens/interview/questions/Part_7/P84/P84_viewmodel.dart';
import 'screens/interview/questions/Part_8/P85/P85_viewmodel.dart';
import 'screens/interview/questions/Part_8/P86_87/P86_87_viewmodel.dart';
import 'screens/interview/questions/Part_8/P88/P88_viewmodel.dart';
import 'screens/interview/questions/Part_8/P89/P89_viewmodel.dart';
import 'screens/interview/questions/Part_8/P90/P90_viewmodel.dart';
import 'screens/interview/questions/Part_8/P91_92/P91_92_viewmodel.dart';
import 'screens/interview/questions/Part_8/P93_94/P93_94_viewmodel.dart';
import 'screens/interview/questions/Part_8/P95/P95_viewmodel.dart';
import 'screens/interview/questions/Part_8/P96/P96_viewmodel.dart';
import 'screens/interview/questions/Part_8/P97/P97_viewmodel.dart';
import 'screens/interview/questions/Part_8/P98/P98_viewmodel.dart';
import 'screens/interview/questions/Part_8/P99/P99_viewmodel.dart';
import 'screens/interview/questions/Select_code/P40_42/P40_42_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q1/Q1_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q2/Q2_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q3/Q3_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q4/Q4_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q5/Q5_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q6/Q6_viewmodel.dart';
import 'screens/interview/questions/actual_people/Q7/Q7_viewmodel.dart';
import 'screens/interview/questions/household_information/detail_information/detail_information_viewmodel.dart';
import 'screens/interview/questions/operating_status/operating_status_viewmodel.dart';
import 'screens/interview/status/interview_status/interview_status_viewmodel.dart';
import 'screens/interview/status/not_interview/not_interview_viewmodel.dart';
import 'screens/login/login_viewmodel.dart';
import 'screens/progress/progress_viewmodel.dart';

import 'screens/replace/area_place/area_replace_viewmodel.dart';
import 'screens/replace/backup_replace/backup_replace_viewmodel.dart';
import 'screens/replace/household_replace/household_replace_viewmodel.dart';
import 'screens/sync/sync_viewmodel.dart';
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
            create: (_) => BottomNavigationViewModel(getIt.get<SyncServices>(),
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
            create: (_) => SyncViewModel(getIt.get<SyncServices>(),
                getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => AreaReplaceViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => HouseholdReplaceViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => BackupReplaceViewModel(getIt.get<SyncServices>(),
                getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => AreaViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => InterviewStatusViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => NotInterviewedViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => CompleteInterviewViewModel(getIt.get<SPrefAppModel>(),
                getIt.get<ExecuteDatabase>(), getIt.get<SyncServices>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => BackupViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => OperatingStatusViewModel(getIt.get<SPrefAppModel>(), getIt.get<ExecuteDatabase>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => DrawerNavigationModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => GeneralInformationViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => DetailInformationViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q1ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q2ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q3ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q4ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q5ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q6ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => Q7ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P01_04ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P05ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P06_07ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P08_09ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P10_12ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P13_14ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P15ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P16ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P17ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P18ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P19ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P20_22ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P23ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P24_25ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P26ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P27ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P28ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P29_30ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P31_32ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P33ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P34ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P35ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P36_37ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P38ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P39_42ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P43ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P44_46ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P47ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P48_49ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P50_51ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P52_54ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P55_59ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P60ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P61_62ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P63_64ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P65_66ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P67_68ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P69ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P70_75ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P76_77ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P78ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P79ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P80ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P81ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P82ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P83ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P84ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P85ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P86_87ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P88ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P89ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P90ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P91_92ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P93_94ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P95ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P96ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P97ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P98ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P99ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => InformationProviderViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => GPSViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P17BViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P40_42ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => P56_58ViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
            lazy: true),
        ChangeNotifierProvider(
            create: (_) => FinishViewModel(getIt.get<ExecuteDatabase>(), getIt.get<SPrefAppModel>()),
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
          title: 'LDVL2024',
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
