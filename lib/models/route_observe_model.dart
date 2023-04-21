import 'package:flutter/material.dart';

class RouteObserverModel {
  static RouteObserverModel? _instance;

  static RouteObserverModel instance() => RouteObserverModel();

  RouteObserverModel._();

  factory RouteObserverModel() {
    if (_instance == null) {
      _instance = RouteObserverModel._();
      _instance!._topRouteObserverModel = _TopRouteObserverModel();
    }
    return _instance!;
  }

  late _TopRouteObserverModel _topRouteObserverModel;

  static RouteObserver topRouteObserver() =>
      instance()._topRouteObserverModel.topRouteObserver;

  void destroyInstance() {
    _instance = null;
  }
}

class _TopRouteObserverModel {
  final topRouteObserver = RouteObserver<PageRoute>();
}
