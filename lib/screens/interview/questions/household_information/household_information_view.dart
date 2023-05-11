import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../components/uis.dart';
import 'household_information_viewmodel.dart';

class HouseholdInformationView extends StatefulWidget {
  const HouseholdInformationView({Key? key}) : super(key: key);

  @override
  State<HouseholdInformationView> createState() => _HouseholdInformationViewState();
}

class _HouseholdInformationViewState extends State<HouseholdInformationView> {
  late HouseholdInformationViewModel householdInformationViewModel;
  int? get index => null;
  final _name = TextEditingController();
  final _address = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    householdInformationViewModel = context.read();
    householdInformationViewModel.onInit(context);
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      householdInformationViewModel = context.read();
      householdInformationViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        _name.text = householdInformationViewModel.data.tenCS.toString(),
        _address.text = householdInformationViewModel.data.diaChi.toString(),
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //UIGPSButton()
        ],
        titleSpacing: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => householdInformationViewModel.HouseholdBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                          child: const UIText(
                            text:UIDescribes.householderName,
                            textColor: Colors.black,
                            textFontSize:fontMedium,
                            isBold: true,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                          child: TextFormField(
                            controller: _name,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Vui lòng nhập tên chủ hộ';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                            ),
                          ),
                        ),
                        //address
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                          child: const UIText(
                            text:UIDescribes.householderAddress,
                            textColor: Colors.black,
                            textFontSize:fontMedium,
                            isBold: true,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                          child: TextFormField(
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
                        ),
                        
                      ],
                    ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  alignment: Alignment.center,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(colors: [
                        mPrimaryColor,
                        Color(0xFF64B5F6),
                        mPrimaryColor,
                      ])),
                  child: MaterialButton(
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
                                            householdInformationViewModel.HouseholdNext();
                                          }
                                      ));
                                }
                                else {
                                  householdInformationViewModel.HouseholdNext();
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
                                    householdInformationViewModel.HouseholdNext();
                                  }
                              ));
                        }
                        else {
                          householdInformationViewModel.HouseholdNext();
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: const UIText(
                      text: UIDescribes.next,
                      textAlign: TextAlign.center,
                      textColor: Colors.white,
                      textFontSize: fontLarge,
                      isBold: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
