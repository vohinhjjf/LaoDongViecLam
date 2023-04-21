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
  List list = ['Chọn tháng điều tra', '1', '2', '3', '4'];

  @override
  void initState() {
    super.initState();
    loginViewModel = context.read();
    loginViewModel.onInit(context);
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
                    height: 40.h,
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      //height: MediaQuery.of(context).size.height - 300.h,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                            )
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            alignment: Alignment.center,
                            child: const UIText(
                              text: UIDescribes.Title,
                              textColor: mPrimaryColor,
                              textFontSize: fontGreater,
                              isBold: true,
                              //textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            alignment: Alignment.center,
                            child: const UIText(
                              textAlign: TextAlign.center,
                              text:UIDescribes.loginTitle,
                              textColor: Colors.black,
                              textFontSize:fontMedium,
                              //textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
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
                              value: list[0],
                              borderRadius: BorderRadius.circular(8.r),
                              items: list.map((e) => DropdownMenuItem(
                                value: e,
                                child: UIText(textColor: Colors.black,text: '$e',),
                              )
                              ).toList(),
                              onChanged: (value){
                                setState(() {

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
                                hintStyle: const TextStyle( color: Colors.grey),
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                ),
                              ),
                              autovalidateMode: AutovalidateMode.always,
                              style: const TextStyle( color: Colors.black),
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
                                hintStyle: const TextStyle(color: Colors.grey),
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
                              style: const TextStyle(color: Colors.black),
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
                            height: 25.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () {
                                //CircularProgressIndicator();
                                if(_formKey.currentState!.validate());
                                {
                                  /*loginViewModel.login(userNameController.text, passwordController.text).then((value) => {
                                  if(value == 'successfully'){
                                    loginViewModel.navigatertoHome()
                                  } else {
                                    _showErrorDialog('Đăng nhập thất bại!')
                                  }
                                }).onError((error, stackTrace) => {
                                  _showErrorDialog('Đăng nhập thất bại!')
                                });*/
                                  loginViewModel.navigateToBottomNavigation();
                                }
                              },
                              height: 50,
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        mSecondaryColor,
                                        mThirdColor,
                                        mSecondaryColor
                                      ]),
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  //boxShadow: []
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      minWidth: MediaQuery.of(context).size.width/3*2,
                                      minHeight: 50.0
                                  ), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const UIText(
                                    text: UIDescribes.login,
                                    textAlign: TextAlign.center,
                                    textColor: Colors.white,
                                    textFontSize: fontLarge,
                                    isBold: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:20.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                      
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: fontMedium),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: const Text('OK',
                      style: TextStyle(
                          
                          color: Colors.white, fontSize: 15)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
              ),
            ],
          ),
        ));
  }

}
