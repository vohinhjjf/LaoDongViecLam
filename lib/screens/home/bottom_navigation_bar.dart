import 'package:flutter/material.dart';
import 'package:lao_dong_viec_lam/screens/home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/uis.dart';
import '../changePass/change_pass_view.dart';
import '../progress/progress_view.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool _home = true, _progress = false, _changePass = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const HomeView(),
      ProgressView(),
      const ChangePassView(),
    ];
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        toolbarHeight: 100.h,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            )
        ),
        //centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            UIText(
              text: "Tháng điều tra: 4",
              textFontSize: 20.sp,
              //textAlign: TextAlign.center,
              textColor: Colors.white,
              isBold: true,
            ),
            SizedBox(
              height: 10.h,
            ),
            UIText(
              text: 'ĐTV: ',
              textFontSize: 18.sp,
              textColor: Colors.white,
              //isBold: true,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurStyle: BlurStyle.inner,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children:widgetOptions,
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        decoration:  const BoxDecoration(
            gradient: LinearGradient(colors: [
              mPrimaryColor,
              mPrimaryColor,
            ]),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buttonWidget(UIDescribes.home, _home ? UIAssets.icDashboard : UIAssets.icNotDashboard,onTap: () {
              pageController.jumpToPage(0);
              setState(() => {
                _home = true,
                _progress = false,
                _changePass = false,
              });
            }),
            _buttonWidget(UIDescribes.progress, _progress?UIAssets.icTask:UIAssets.icNotTask,onTap: () {
              pageController.jumpToPage(1);
              setState(() => {
                _home = false,
                _progress = true,
                _changePass = false,
              });
            }),
            _buttonWidget(UIDescribes.changePass,_changePass ? UIAssets.icChangePass:UIAssets.icNotChangePass,onTap: () {
              pageController.jumpToPage(2);
              setState(() => {
                _home = false,
                _progress = false,
                _changePass = true,
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget(String title, String icon, {required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        //height: 90.h,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration:  BoxDecoration(
          //border: Border.all(color: check ? mThirdColor : Colors.white, width: 2),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: mCompleteColor.shade400,
              blurRadius: 10, // soften the shadow
              spreadRadius: -5, //extend the shadow
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 55,
              height: 55,
              colorBlendMode: BlendMode.color,
            ),
            const SizedBox(height: 5,),
            UIText(
              text: title,
              textColor: mPrimaryColor,
              isBold: true,
              textFontSize: fontSmall,
              //isBold: true,
            ),
          ],
        ),
      ),
    );
  }
}