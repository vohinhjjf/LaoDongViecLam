import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/screens/interview/questions/Person_providing_information/information_provider_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/questions/Select_code/P17B/P17B_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/questions/Select_code/P40_42/P40_42_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/questions/Select_code/P56_58/P56_58_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/questions/household_information/general_information/general_information_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/status/backup/backup_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/status/complete_interview/complete_interview_view.dart';

import '../../screens/interview/questions/GPS/gps_view.dart';
import '../../screens/interview/questions/Part_1/P05/P05_view.dart';
import '../../screens/interview/questions/Part_1/P01_04/P01_04_view.dart';
import '../../screens/interview/questions/Part_1/P06_07/P06_07_view.dart';

import '../../screens/interview/questions/Part_2/P08_09/P08_09_view.dart';
import '../../screens/interview/questions/Part_2/P10_12/P10_12_view.dart';
import '../../screens/interview/questions/Part_2/P13/P13_view.dart';
import '../../screens/interview/questions/Part_2/P14_15/P14_15_view.dart';
import '../../screens/interview/questions/Part_2/P16/P16_view.dart';
import '../../screens/interview/questions/Part_2/P17/P17_view.dart';
import '../../screens/interview/questions/Part_2/P18/P18_view.dart';

import '../../screens/interview/questions/Part_3/P19/P19_view.dart';
import '../../screens/interview/questions/Part_3/P20_22/P20_22_view.dart';
import '../../screens/interview/questions/Part_3/P23/P23_view.dart';
import '../../screens/interview/questions/Part_3/P24_25/P24_25_view.dart';
import '../../screens/interview/questions/Part_3/P26/P26_view.dart';
import '../../screens/interview/questions/Part_3/P27/P27_view.dart';
import '../../screens/interview/questions/Part_3/P28/P28_view.dart';
import '../../screens/interview/questions/Part_3/P29_30/P29_30_view.dart';
import '../../screens/interview/questions/Part_3/P31_32/P31_32_view.dart';
import '../../screens/interview/questions/Part_3/P33/P33_view.dart';
import '../../screens/interview/questions/Part_3/P34/P34_view.dart';
import '../../screens/interview/questions/Part_3/P35/P35_view.dart';
import '../../screens/interview/questions/Part_3/P36_37/P36_37_view.dart';
import '../../screens/interview/questions/Part_3/P38/P38_view.dart';

import '../../screens/interview/questions/Part_4/P39_42/P39_42_view.dart';
import '../../screens/interview/questions/Part_4/P43/P43_view.dart';
import '../../screens/interview/questions/Part_4/P44_46/P44_46_view.dart';
import '../../screens/interview/questions/Part_4/P47/P47_view.dart';
import '../../screens/interview/questions/Part_4/P48_49/P48_49_view.dart';
import '../../screens/interview/questions/Part_4/P50_51/P50_51_view.dart';
import '../../screens/interview/questions/Part_4/P52_54/P52_54_view.dart';

import '../../screens/interview/questions/Part_5/P55_59/P55_59_view.dart';
import '../../screens/interview/questions/Part_5/P60/P60_view.dart';
import '../../screens/interview/questions/Part_5/P61_62/P61_62_view.dart';
import '../../screens/interview/questions/Part_5/P63_64/P63_64_view.dart';
import '../../screens/interview/questions/Part_5/P65_66/P65_66_view.dart';
import '../../screens/interview/questions/Part_5/P67_68/P67_68_view.dart';

import '../../screens/interview/questions/Part_6/P69/P69_view.dart';
import '../../screens/interview/questions/Part_6/P70_75/P70_75_view.dart';

import '../../screens/interview/questions/Part_7/P76_77/P76_77_view.dart';
import '../../screens/interview/questions/Part_7/P78/P78_view.dart';
import '../../screens/interview/questions/Part_7/P79/P79_view.dart';
import '../../screens/interview/questions/Part_7/P80/P80_view.dart';
import '../../screens/interview/questions/Part_7/P81/P81_view.dart';
import '../../screens/interview/questions/Part_7/P82/P82_view.dart';
import '../../screens/interview/questions/Part_7/P83/P83_view.dart';
import '../../screens/interview/questions/Part_7/P84/P84_view.dart';

import '../../screens/interview/questions/Part_8/P85/P85_view.dart';
import '../../screens/interview/questions/Part_8/P86_87/P86_87_view.dart';
import '../../screens/interview/questions/Part_8/P88/P88_view.dart';
import '../../screens/interview/questions/Part_8/P89/P89_view.dart';
import '../../screens/interview/questions/Part_8/P90/P90_view.dart';
import '../../screens/interview/questions/Part_8/P91_92/P91_92_view.dart';
import '../../screens/interview/questions/Part_8/P93_94/P93_94_view.dart';
import '../../screens/interview/questions/Part_8/P95/P95_view.dart';
import '../../screens/interview/questions/Part_8/P96/P96_view.dart';
import '../../screens/interview/questions/Part_8/P97/P97_view.dart';
import '../../screens/interview/questions/Part_8/P98/P98_view.dart';
import '../../screens/interview/questions/Part_8/P99/P99_view.dart';

import '../../screens/interview/questions/actual_people/Q1/Q1_view.dart';
import '../../screens/interview/questions/actual_people/Q2/Q2_view.dart';
import '../../screens/interview/questions/actual_people/Q3/Q3_view.dart';
import '../../screens/interview/questions/actual_people/Q4/Q4_view.dart';
import '../../screens/interview/questions/actual_people/Q5/Q5_view.dart';
import '../../screens/interview/questions/actual_people/Q6/Q6_view.dart';
import '../../screens/interview/questions/actual_people/Q7/Q7_view.dart';

import '../../screens/interview/questions/household_information/detail_information/detail_information_view.dart';

import '../../screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../screens/home/home_view.dart';
import '../../screens/interview/area/area_view.dart';
import '../../screens/interview/questions/operating_status/operating_status_view.dart';
import '../../screens/interview/status/interview_status/interview_status_view.dart';
import '../../screens/interview/status/not_interview/not_interview_view.dart';
import '../../screens/login/login_view.dart';
import '../../screens/progress/progress_view.dart';
import '../../screens/splash/splash_view.dart';
import '../../screens/sync/sync_view.dart';
import 'custom_pageroute.dart';
import 'route_constants.dart';

class NavigationServices {
  static const NavigationServices _instance = NavigationServices._internal();

  static NavigationServices get instance => _instance;

  const NavigationServices._internal();

  factory NavigationServices() {
    return _instance;
  }

  Route<dynamic> routeBuilders(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.loginRoute:
        return CustomPageRoute(const LoginView());
      case RouteConstants.bottomNavigatorRoute:
        return CustomPageRoute(BottomNavigation());
      case RouteConstants.homeRoute:
        return CustomPageRoute(const HomeView());
      case RouteConstants.interviewArea:
        return CustomPageRoute(AreaView());
      case RouteConstants.interviewStatusRoute:
        return CustomPageRoute(const InterviewStatusView());
      case RouteConstants.notInterviewedRoute:
        return CustomPageRoute(const NotInterviewedView());
      case RouteConstants.operatingStatusRoute:
        return CustomPageRoute(const OperatingStatusView());
      case RouteConstants.completeInterviewRoute:
        return CustomPageRoute(const CompleteInterviewView());
      case RouteConstants.BackupRoute:
        return CustomPageRoute(const BackupView());
      case RouteConstants.generalRoute:
        return CustomPageRoute(const GeneralInformationView());
      case RouteConstants.detailRoute:
        return CustomPageRoute(const DetailInformationView());
      case RouteConstants.q1Route:
        return CustomPageRoute(const Q1View());
      case RouteConstants.q2Route:
        return CustomPageRoute(const Q2View());
      case RouteConstants.q3Route:
        return CustomPageRoute(const Q3View());
      case RouteConstants.q4Route:
        return CustomPageRoute(const Q4View());
      case RouteConstants.q5Route:
        return CustomPageRoute(const Q5View());
      case RouteConstants.q6Route:
        return CustomPageRoute(const Q6View());
      case RouteConstants.q7Route:
        return CustomPageRoute(const Q7View());
      case RouteConstants.P01_04Route:
        return CustomPageRoute(const P01_04View());
      case RouteConstants.P05Route:
        return CustomPageRoute(const P05View());
      case RouteConstants.P06_07Route:
        return CustomPageRoute(const P06_07View());
      case RouteConstants.P08_09Route:
        return CustomPageRoute(const P08_09View());
      case RouteConstants.P10_12Route:
        return CustomPageRoute(const P10_12View());
      case RouteConstants.P13Route:
        return CustomPageRoute(const P13View());
      case RouteConstants.P14_15Route:
        return CustomPageRoute(const P14_15View());
      case RouteConstants.P16Route:
        return CustomPageRoute(const P16View());
      case RouteConstants.P17Route:
        return CustomPageRoute(const P17View());
      case RouteConstants.P18Route:
        return CustomPageRoute(const P18View());
      case RouteConstants.P19Route:
        return CustomPageRoute(const P19View());
      case RouteConstants.P20_22Route:
        return CustomPageRoute(const P20_22View());
      case RouteConstants.P23Route:
        return CustomPageRoute(const P23View());
      case RouteConstants.P24_25Route:
        return CustomPageRoute(const P24_25View());
      case RouteConstants.P26Route:
        return CustomPageRoute(const P26View());
      case RouteConstants.P27Route:
        return CustomPageRoute(const P27View());
      case RouteConstants.P28Route:
        return CustomPageRoute(const P28View());
      case RouteConstants.P29_30Route:
        return CustomPageRoute(const P29_30View());
      case RouteConstants.P31_32Route:
        return CustomPageRoute(const P31_32View());
      case RouteConstants.P33Route:
        return CustomPageRoute(const P33View());
      case RouteConstants.P34Route:
        return CustomPageRoute(const P34View());
      case RouteConstants.P35Route:
        return CustomPageRoute(const P35View());
      case RouteConstants.P36_37Route:
        return CustomPageRoute(const P36_37View());
      case RouteConstants.P38Route:
        return CustomPageRoute(const P38View());
      case RouteConstants.P39_42Route:
        return CustomPageRoute(const P39_42View());
      case RouteConstants.P43Route:
        return CustomPageRoute(const P43View());
      case RouteConstants.P44_46Route:
        return CustomPageRoute(const P44_46View());
      case RouteConstants.P47Route:
        return CustomPageRoute(const P47View());
      case RouteConstants.P48_49Route:
        return CustomPageRoute(const P48_49View());
      case RouteConstants.P50_51Route:
        return CustomPageRoute(const P50_51View());
      case RouteConstants.P52_54Route:
        return CustomPageRoute(const P52_54View());
      case RouteConstants.P55_59Route:
        return CustomPageRoute(const P55_59View());
      case RouteConstants.P60Route:
        return CustomPageRoute(const P60View());
      case RouteConstants.P61_62Route:
        return CustomPageRoute(const P61_62View());
      case RouteConstants.P63_64Route:
        return CustomPageRoute(const P63_64View());
      case RouteConstants.P65_66Route:
        return CustomPageRoute(const P65_66View());
      case RouteConstants.P67_68Route:
        return CustomPageRoute(const P67_68View());
      case RouteConstants.P69Route:
        return CustomPageRoute(const P69View());
      case RouteConstants.P70_75Route:
        return CustomPageRoute(const P70_75View());
      case RouteConstants.P76_77Route:
        return CustomPageRoute(const P76_77View());
      case RouteConstants.P78Route:
        return CustomPageRoute(const P78View());
      case RouteConstants.P79Route:
        return CustomPageRoute(const P79View());
      case RouteConstants.P80Route:
        return CustomPageRoute(const P80View());
      case RouteConstants.P81Route:
        return CustomPageRoute(const P81View());
      case RouteConstants.P82Route:
        return CustomPageRoute(const P82View());
      case RouteConstants.P83Route:
        return CustomPageRoute(const P83View());
      case RouteConstants.P84Route:
        return CustomPageRoute(const P84View());
      case RouteConstants.P85Route:
        return CustomPageRoute(const P85View());
      case RouteConstants.P86_87Route:
        return CustomPageRoute(const P86_87View());
      case RouteConstants.P88Route:
        return CustomPageRoute(const P88View());
      case RouteConstants.P89Route:
        return CustomPageRoute(const P89View());
      case RouteConstants.P90Route:
        return CustomPageRoute(const P90View());
      case RouteConstants.P91_92Route:
        return CustomPageRoute(const P91_92View());
      case RouteConstants.P93_94Route:
        return CustomPageRoute(const P93_94View());
      case RouteConstants.P95Route:
        return CustomPageRoute(const P95View());
      case RouteConstants.P96Route:
        return CustomPageRoute(const P96View());
      case RouteConstants.P97Route:
        return CustomPageRoute(const P97View());
      case RouteConstants.P98Route:
        return CustomPageRoute(const P98View());
      case RouteConstants.P99Route:
        return CustomPageRoute(const P99View());
      case RouteConstants.InformationProviderRoute:
        return CustomPageRoute(const InformationProviderView());
      case RouteConstants.gPSRoute:
        return CustomPageRoute(const GPSView());
      case RouteConstants.P17BRoute:
        return CustomPageRoute(const P17BView());
      case RouteConstants.P40_42Route:
        return CustomPageRoute(const P40_42View());
      case RouteConstants.P56_58Route:
        return CustomPageRoute(const P56_58View());
      case RouteConstants.syncRoute:
        return CustomPageRoute(const SyncView());
      case RouteConstants.progressRoute:
        return CustomPageRoute(ProgressView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteConstants.loginRoute, (route) => false);
  }

  void navigateToBottomNavigation(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteConstants.bottomNavigatorRoute, (route) => false);
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteConstants.homeRoute, (route) => false);
  }

  void navigateToChangePass(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.changePassRoute);
  }

  void navigateToSync(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.syncRoute);
  }

  void navigateToProgress(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.progressRoute);
  }

  void navigateToArea(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.interviewArea);
  }

  void navigateToInterviewStatus(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.interviewStatusRoute);
  }

  void navigateToNotInterviewed(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.notInterviewedRoute);
  }

  void navigateToCompleteInterview(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.completeInterviewRoute);
  }

  void navigateToBackup(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.BackupRoute);
  }

  void navigateToOperatingStatus(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.operatingStatusRoute);
  }

  void navigateToDetailInformation(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.detailRoute);
  }

  void navigateToGeneralInformation(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.generalRoute);
  }

  void navigateToQ1(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q1Route);
  }

  void navigateToQ2(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q2Route);
  }

  void navigateToQ3(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q3Route);
  }

  void navigateToQ4(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q4Route);
  }

  void navigateToQ5(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q5Route);
  }

  void navigateToQ6(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q6Route);
  }

  void navigateToQ7(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.q7Route);
  }
  void navigateToP01_04(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P01_04Route);
  }
  void navigateToP05(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P05Route);
  }
  void navigateToP06_07(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P06_07Route);
  }
  void navigateToP08_09(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P08_09Route);
  }
  void navigateToP10_12(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P10_12Route);
  }
  void navigateToP13(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P13Route);
  }
  void navigateToP14_15(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P14_15Route);
  }
  void navigateToP16(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P16Route);
  }
  void navigateToP17(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P17Route);
  }
  void navigateToP18(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P18Route);
  }
  void navigateToP19(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P19Route);
  }
  void navigateToP20_22(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P20_22Route);
  }
  void navigateToP23(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P23Route);
  }
  void navigateToP24_25(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P24_25Route);
  }
  void navigateToP26(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P26Route);
  }
  void navigateToP27(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P27Route);
  }
  void navigateToP28(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P28Route);
  }
  void navigateToP29_30(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P29_30Route);
  }
  void navigateToP31_32(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P31_32Route);
  }
  void navigateToP33(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P33Route);
  }
  void navigateToP34(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P34Route);
  }
  void navigateToP35(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P35Route);
  }
  void navigateToP36_37(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P36_37Route);
  }
  void navigateToP38(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P38Route);
  }
  void navigateToP39_42(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P39_42Route);
  }
  void navigateToP43(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P43Route);
  }
  void navigateToP44_46(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P44_46Route);
  }
  void navigateToP47(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P47Route);
  }
  void navigateToP48_49(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P48_49Route);
  }
  void navigateToP50_51(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P50_51Route);
  }
  void navigateToP52_54(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P52_54Route);
  }
  void navigateToP55_59(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P55_59Route);
  }
  void navigateToP60(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P60Route);
  }
  void navigateToP61_62(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P61_62Route);
  }
  void navigateToP63_64(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P63_64Route);
  }
  void navigateToP65_66(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P65_66Route);
  }
  void navigateToP67_68(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P67_68Route);
  }
  void navigateToP69(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P69Route);
  }
  //
  void navigateToP70_75(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P70_75Route);
  }
  void navigateToP76_77(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P76_77Route);
  }
  void navigateToP78(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P78Route);
  }
  void navigateToP79(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P79Route);
  }
  void navigateToP80(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P80Route);
  }
  void navigateToP81(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P81Route);
  }
  void navigateToP82(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P82Route);
  }
  void navigateToP83(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P83Route);
  }
  void navigateToP84(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P84Route);
  }
  void navigateToP85(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P85Route);
  }
  void navigateToP86_87(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P86_87Route);
  }
  void navigateToP88(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P88Route);
  }
  void navigateToP89(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P89Route);
  }
  void navigateToP90(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P90Route);
  }
  void navigateToP91_92(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P91_92Route);
  }
  void navigateToP93_94(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P93_94Route);
  }
  void navigateToP95(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P95Route);
  }
  void navigateToP96(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P96Route);
  }
  void navigateToP97(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P97Route);
  }
  void navigateToP98(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P98Route);
  }
  void navigateToP99(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P99Route);
  }
  void navigateToInformationProvider(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.InformationProviderRoute);
  }
  void navigateToGPS(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.gPSRoute);
  }
  void navigateToP17B(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P17BRoute);
  }
  void navigateToP40_42(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P40_42Route);
  }
  void navigateToP56_58(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.P56_58Route);
  }
}
