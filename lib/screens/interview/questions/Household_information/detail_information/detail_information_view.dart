import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import 'detail_information_viewmodel.dart';

class DetailInformationView extends StatefulWidget {
  const DetailInformationView({Key? key}) : super(key: key);

  @override
  State<DetailInformationView> createState() => _DetailInformationViewState();
}

class _DetailInformationViewState extends State<DetailInformationView> {
  late DetailInformationViewModel detailInformationViewModel;
  int? get index => null;
  final _name = TextEditingController();
  final _address = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      detailInformationViewModel = context.read();
      detailInformationViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        _name.text = detailInformationViewModel.data.tenChuHo == null ?""
            :detailInformationViewModel.data.tenChuHo.toString(),
        _address.text = detailInformationViewModel.data.diachi == null ?""
            :detailInformationViewModel.data.diachi.toString(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        iconTheme: const IconThemeData(color: mPrimaryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontGreater,
          isBold: true,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    UIText(
                      text:UIDescribes.householderName,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _name,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Vui lòng nhập tên chủ hộ';
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                        FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                      ],
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),
                    SizedBox(height: 15,),
                    //address
                    const UIText(
                      text:UIDescribes.householderAddress,
                      textColor: Colors.black,
                      textFontSize:fontLarge,
                      isBold: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _address,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Vui lòng nhập địa chỉ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                      child: Container(
                        padding: const EdgeInsets.only(right: 4),
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.black54, width: 2))),
                        child: IconButton(
                          onPressed: () {
                            detailInformationViewModel.HouseholdBack();
                          },
                          icon: const Icon(
                            Icons.navigate_before,
                            color: Colors.black54,
                            size: 35,
                          ),
                        ),
                      )), //back
                  ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.black54, width: 2))),
                        child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if(_name.text.length < 5){
                                showDialog(
                                    context: context,
                                    builder: (_) => UINotificationDialog(
                                        notification: 'Họ và tên chủ hộ quá ngắn dưới 5 ký tự!',
                                        onpress: (){
                                          Navigator.of(context, rootNavigator: true).pop();
                                          if(_address.text.length < 5){
                                            showDialog(
                                                context: context,
                                                builder: (_) => UINotificationDialog(
                                                    notification: 'Địa chỉ hộ quá ngắn dưới 5 ký tự!',
                                                    onpress:   (){
                                                      Navigator.of(context, rootNavigator: true).pop();
                                                      detailInformationViewModel.HouseholdNext(_name.text, _address.text);
                                                    }
                                                ));
                                          }
                                          else {
                                            detailInformationViewModel.HouseholdNext(_name.text, _address.text);
                                          }
                                        }
                                    ));
                              }
                              else if(_address.text.length < 5){
                                showDialog(
                                    context: context,
                                    builder: (_) => UINotificationDialog(
                                        notification: 'Địa chỉ sơ sở quá ngắn dưới 5 ký tự!',
                                        onpress:   (){
                                          Navigator.of(context, rootNavigator: true).pop();
                                          detailInformationViewModel.HouseholdNext(_name.text, _address.text);
                                        }
                                    ));
                              }
                              else {
                                detailInformationViewModel.HouseholdNext(_name.text, _address.text);
                              }
                            }
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.black54,
                            size: 35,
                          ),
                        ),
                      )), //next
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}
