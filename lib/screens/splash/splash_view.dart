import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/ui_assets.dart';
import '../../data/shared_preferences/spref_app_model.dart';
import '../../network/app_injection.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashViewModel(getIt.get<SPrefAppModel>()).onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                UIAssets.icLogo,
                height: 200.h,
                width: 200.w,
              ),
              //const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

