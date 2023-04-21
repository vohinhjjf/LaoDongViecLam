import 'package:flutter/material.dart';

import '../../screens/home/bottom_navigation_bar.dart';
import '../../screens/home/home_view.dart';
import '../../screens/interview/area/area_view.dart';
import '../../screens/interview/status/interview_status/interview_status_view.dart';
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
    /*case RouteConstants.notInterviewedRoute:
        return CustomPageRoute(const NotInterviewedView());
      case RouteConstants.interviewingRoute:
        return CustomPageRoute(const InterviewingView());
      case RouteConstants.completeInterviewRoute:
        return CustomPageRoute(const CompleteInterviewView());
      case RouteConstants.operatingStatusRoute:
        return CustomPageRoute(const OperatingStatusView());
      case RouteConstants.baseInformationRoute:
        return CustomPageRoute(const BaseInformationView());
      case RouteConstants.headBaseInformationRoute:
        return CustomPageRoute(const HeadBaseInformationView());
      case RouteConstants.questionA16Route:
        return CustomPageRoute(const QuestionA16View());
      case RouteConstants.questionA17Route:
        return CustomPageRoute(const QuestionA17View());
      case RouteConstants.questionA18Route:
        return CustomPageRoute(const QuestionA18View());
      case RouteConstants.questionA21Route:
        return CustomPageRoute(const QuestionA21View());
      case RouteConstants.questionA22Route:
        return CustomPageRoute(const QuestionA22View());
      case RouteConstants.questionA3Route:
        return CustomPageRoute(const QuestionA3View());
      case RouteConstants.questionA41_1Route:
        return CustomPageRoute(const QuestionA41_1View());
      case RouteConstants.questionA41_2Route:
        return CustomPageRoute(const QuestionA41_2View());
      case RouteConstants.questionA42Route:
        return CustomPageRoute(const QuestionA42View());
      case RouteConstants.questionA43Route:
        return CustomPageRoute(const QuestionA43View());
      case RouteConstants.questionA43AddActivityRoute:
        return CustomPageRoute(const QuestionA43AddActivityView());
      case RouteConstants.nguoiKhaiPhieu:
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

  void navigateToBaseInformation(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.baseInformationRoute);
  }

  void navigateToHeadBaseInformation(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.headBaseInformationRoute);
  }

  void navigateToQuestionA16(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA16Route);
  }

  void navigateToQuestionA17(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA17Route);
  }

  void navigateToQuestionA18(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA18Route);
  }

  void navigateToQuestionA21(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA21Route);
  }

  void navigateToQuestionA22(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA22Route);
  }

  void navigateToQuestionA3(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA3Route);
  }
  void navigateToQuestionA41_1(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA41_1Route);
  }
  void navigateToQuestionA41_2(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA41_2Route);
  }
  void navigateToQuestionA42(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA42Route);
  }
  void navigateToQuestionA43(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA43Route);
  }
  void navigateToQuestionA43AddActivity(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.questionA43AddActivityRoute);
  }
  void navigateToNguoiKhaiPhieu(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.nguoiKhaiPhieu);
  }
  void navigateToGPS(BuildContext context) {
    Navigator.of(context).pushNamed(RouteConstants.gPS);
  }
}
