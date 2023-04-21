import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  late BuildContext _context;

  BuildContext get context => _context;

  void onInit(BuildContext context) {
    _context = context;
  }
}
