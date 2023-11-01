import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/screens/home/home_view.dart';
import 'package:lao_dong_viec_lam/screens/interview/area/area_view.dart';
import 'package:provider/provider.dart';
import '../../components/uis.dart';
import '../changePass/change_pass_view.dart';
import 'bottom_navigation_bar_viewmodel.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late BottomNavigationViewModel bottomNavigationViewModel;
  String _dtv = "", _month = '';
  bool _home = true, _changePass = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bottomNavigationViewModel = context.read();
      bottomNavigationViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              _dtv = bottomNavigationViewModel.userName ?? "";
              _month = bottomNavigationViewModel.month ?? "";
            })
          });
    });
  }

  // Dispose the PageController
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const HomeView(),
      const ChangePassView(),
    ];
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                mPrimaryColor,Colors.blue.shade400,mPrimaryColor
              ],
            ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
          ),
        ),
        toolbarHeight: 60.h,
        //centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.only(top: 10.h),
            //   alignment: Alignment.center,
            //   child: const UIText(
            //     text: UIDescribes.slogan,
            //     textAlign: TextAlign.center,
            //     textColor: Colors.white,
            //     textFontSize: fontGreater,
            //     isBold: true,
            //     //textStyle: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              alignment: Alignment.center,
              child: UIText(
                text: "Tháng điều tra: $_month",
                textFontSize: fontLarge,
                textAlign: TextAlign.center,
                textColor: Colors.white,
                isBold: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              alignment: Alignment.center,
              child: UIText(
                text: 'Điều tra viên: $_dtv',
                textFontSize: fontLarge,
                textColor: Colors.white,
                isBold: true,
                //isBold: true,
              ),
            )
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
          children: widgetOptions,
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        color: Colors.blue.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buttonWidget(UIDescribes.home, _home ? UIAssets.icDashboard : UIAssets.icNotDashboard,onTap: () {
              pageController.jumpToPage(0);
              setState(() => {
                _home = true,
                _changePass = false,
              });
            }),
            _buttonWidget(UIDescribes.changePass,_changePass ? UIAssets.icChangePass:UIAssets.icNotChangePass,onTap: () {
              pageController.jumpToPage(1);
              setState(() => {
                _home = false,
                _changePass = true,
              });
            }),
            _buttonWidget(UIDescribes.logout, UIAssets.icNotLogout,onTap: () {
              bottomNavigationViewModel.logout();
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
              textColor: Colors.black,
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