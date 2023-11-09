import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../components/uis.dart';
import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel loginViewModel;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  List<String> list = ['điều tra', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];
  String month = 'điều tra';

  @override
  void initState() {
    super.initState();
    loginViewModel = context.read();
    loginViewModel.onInit(context);
    userNameController.text = "DTV99001";
    passwordController.text = "123a@";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    mPrimaryColor, mThirdColor,mSecondaryColor
                  ])),
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Image.asset(
                    UIAssets.icLogo,
                    height: 150.h,
                    width: 150.w,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: const UIText(
                      text: UIDescribes.slogan,
                      textAlign: TextAlign.center,
                      textColor: Colors.white,
                      textFontSize: fontGreater,
                      isBold: true,
                      //textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        elevation: 10,
        backgroundColor: Colors.blue,
        enableDrag: false,
        onClosing: () {},
        builder: (BuildContext context) => Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.blue.shade600, mThirdColor
                  ])),
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
            ),
            // height: MediaQuery.of(context).size.height < 650 ? 300.h : 400.h,
            height: MediaQuery.of(context).size.height < 650 ? 400.h : 400.h,
            child: ListView(
              /*crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,*/
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: const UIText(
                    text: UIDescribes.slogan,
                    textAlign: TextAlign.center,
                    textColor: mPrimaryColor,
                    textFontSize: fontGreater,
                    isBold: true,
                    //textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 5.h),
                //   alignment: Alignment.center,
                //   child: const UIText(
                //     text: UIDescribes.Title,
                //     textColor: mPrimaryColor,
                //     textFontSize: fontGreater,
                //     isBold: true,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                  margin: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                  //height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: DropdownButton(
                    value: month,
                    borderRadius: BorderRadius.circular(8.r),
                    items: list.map((e) => DropdownMenuItem(
                      value: e,
                      child: UIText(textColor: Colors.black,text: 'Tháng $e', textFontSize: fontLarge,),
                    )
                    ).toList(),
                    onChanged: (value){
                      setState(() {
                        month = value!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      hintText: UIDescribes.hintUserName,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: fontLarge),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                      ),
                    ),
                    //scrollPadding: EdgeInsets.only(bottom:40),
                    autovalidateMode: AutovalidateMode.always,
                    style: const TextStyle(color: Colors.black, fontSize: fontLarge),
                    validator: (value) {
                      if (value == null) {
                        return UIDescribes.enterUser;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _showPassword, //ẩn pass
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      hintText: UIDescribes.hintPass,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: fontLarge),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: Icon(
                          !_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mSecondaryColor,
                        ),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    style: const TextStyle(color: Colors.black, fontSize: fontLarge),
                    validator: (value) {
                      // if (loginViewModel.isPasswordValidate) {
                      //   return UIValues.enterPass;
                      // }
                      if (value == null) {
                        return UIDescribes.enterPass;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                  EdgeInsets.symmetric(horizontal: 20.w),
                  child: MaterialButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    onPressed: () {
                      //CircularProgressIndicator();
                      if(_formKey.currentState!.validate());
                      {
                        print(userNameController.text);
                        print(passwordController.text);
                        print(month);
                        if(month != "điều tra") {
                          if(int.parse(month) > DateTime.now().month){
                            _showErrorDialog('Không chọn tháng sau tháng điều tra!');
                          } else {
                            loginViewModel.login(
                                userNameController.text,
                                passwordController.text,
                                month).then((value) =>
                            {
                              if(value == 'successfully'){
                                loginViewModel.navigateToBottomNavigation()
                              } else
                                {
                                  _showErrorDialog('Tài khoản Điều tra viên hoặc mật khẩu không đúng.\nVui lòng kiểm tra lại!')
                                }
                            }).onError((error, stackTrace) =>
                            {
                              _showErrorDialog('Tài khoản Điều tra viên hoặc mật khẩu không đúng.\nVui lòng kiểm tra lại!')
                            });
                          }
                        }
                        else {
                          _showErrorDialog('Vui lòng chọn tháng!');
                        }
                      }
                      print(MediaQuery.of(context).size.height);
                    },
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,

                    child: const UIText(
                      text: UIDescribes.login,
                      textAlign: TextAlign.center,
                      textColor: Colors.white,
                      textFontSize: fontLarge,
                      isBold: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.h, left: 20.w,right: 20.w),
                  child: const UIText(
                    textAlign: TextAlign.center,
                    text: "Version 0.0.1",
                    textColor: mPrimaryColor,
                    textFontSize:fontMedium,
                    isBold: true,
                    //textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _showErrorDialog(String title){
    showDialog(
        context: context,
        builder: (_) =>AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: const Image(
            width: 150,
            height: 150,
            image: AssetImage("assets/images/warning.gif"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: fontLarge),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: const Text('Đồng ý',
                      style: TextStyle(
                          color: Colors.white, fontSize: fontLarge)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
              ),
            ],
          ),
        ));
  }
}
