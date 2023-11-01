import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/uis.dart';
import 'change_pass_viewmodel.dart';

class ChangePassView extends StatefulWidget{
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Body createState() => Body();
}
class Body extends State{
  final _password_old = TextEditingController();
  final _password_new = TextEditingController();
  final _password_new_replay = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ChangePasswordViewModel changePasswordViewModel;

  @override
  void initState() {
    super.initState();
    changePasswordViewModel = context.read();
    changePasswordViewModel.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: _password_old,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Mật khẩu hiện tại chưa được nhập';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mPrimaryColor, width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),

                              hintText: "Mật khẩu hiện tại",
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: _password_new,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Mật khẩu mới chưa được nhập';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mPrimaryColor, width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: "Mật khẩu mới",
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: _password_new_replay,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Mật khẩu mới chưa được nhập';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mPrimaryColor, width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: "Nhập lại mật khẩu mới",
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MaterialButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          if(_password_new_replay.text == _password_new.text){
                            changePasswordViewModel.changePass(_password_old.text, _password_new.text).then((value) => {
                              if(value == 'sucessfully'){
                                _showMaterialDialog()
                              } else {
                                _showErrorDialog("Đổi mật khẩu thất bại!")
                              }
                            });
                          } else {
                            _showErrorDialog("Nhập lại mật khẩu sai!");
                          }
                        });
                      }
                      else{
                        print('clicked');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: const LinearGradient(colors: [
                            mPrimaryColor,
                            Color(0xFF64B5F6),
                            mPrimaryColor,
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: const UIText(
                        text: "XÁC NHẬN",
                        textAlign: TextAlign.center,
                          textColor: Colors.white,
                          isBold: true,
                          textFontSize: fontLarge
                      ),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) =>  AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title:  const Image(
            width: 130,
            height: 130,
            image: AssetImage("assets/images/success.gif"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const UIText(
                text:"Bạn đã đổi mật khẩu thành công!",
                textAlign: TextAlign.center,
                textColor: Colors.black,
                textFontSize: fontMedium,
                isBold: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: const UIText(
                      text:'Đăng nhập',
                      textColor: Colors.white,
                      textFontSize: fontLarge
                  ),
                  onPressed: () {
                      changePasswordViewModel.logout();
                  }
              ),
            ],
          ),
        ));
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
                child: UIText(
                  text: title,
                  textAlign: TextAlign.center,
                  textColor: Colors.black,
                  isBold: true,
                    textFontSize: fontLarge
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: const UIText(
                      text:'Thử lại',
                      textColor: Colors.white,
                      textFontSize: fontLarge
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
              ),
            ],
          ),
        ));
  }
}