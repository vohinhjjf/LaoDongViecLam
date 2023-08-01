import 'package:flutter/material.dart';

import '../../screens/interview/questions/Part_1/P05/P05_view.dart';
import '../../screens/interview/questions/Part_1/P08_09/P08_09_view.dart';
import '../../screens/interview/questions/Part_1/P10_12/P10_12_view.dart';
import '../../screens/interview/questions/Part_1/P01_04/P01_04_view.dart';
import '../../screens/interview/questions/Part_1/P06_07/P06_07_view.dart';
import '../../screens/interview/questions/actual_people/Q1/Q1_view.dart';
import '../../screens/interview/questions/actual_people/Q2/Q2_view.dart';
import '../../screens/interview/questions/actual_people/Q3/Q3_view.dart';
import '../../screens/interview/questions/actual_people/Q4/Q4_view.dart';
import '../../screens/interview/questions/actual_people/Q5/Q5_view.dart';
import '../../screens/interview/questions/actual_people/Q6/Q6_view.dart';
import '../../screens/interview/questions/actual_people/Q7/Q7_view.dart';
import '../../screens/interview/questions/household_information/household_information_view.dart';

import '../../screens/home/bottom_navigation_bar.dart';
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
      /*case RouteConstants.interviewingRoute:
        return CustomPageRoute(const InterviewingView());
      case RouteConstants.completeInterviewRoute:
        return CustomPageRoute(const CompleteInterviewView());*/
      case RouteConstants.householdRoute:
        return CustomPageRoute(const HouseholdInformationView());
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
    /*case RouteConstants.nguoiKhaiPhieu:
        return CustomPageRoute(const NguoiKhaiPhieuView());
      case RouteConstants.gPS:
        return CustomPageRoute(const GPSView());*/
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

  void navigateToInterviewing(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.interviewingRoute);
  }

  void navigateToCompleteInterview(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.completeInterviewRoute);
  }

  void navigateToOperatingStatus(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.operatingStatusRoute);
  }

  void navigateToHouseHold(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.householdRoute);
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
  void navigateToNguoiKhaiPhieu(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.nguoiKhaiPhieu);
  }
  void navigateToGPS(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.gPS);
  }
}
