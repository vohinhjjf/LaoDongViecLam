import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVienNKTT_model.dart';
import 'information_provider_viewmodel.dart';


class InformationProviderView extends StatefulWidget {
  const InformationProviderView({Key? key}) : super(key: key);

  @override
  State<InformationProviderView> createState() => _InformationProviderViewState();
}

class _InformationProviderViewState extends State<InformationProviderView> {
  late InformationProviderViewModel informationProviderviewModel;
  int groupValue = 0, stt = 0;
  List<Map<String, int>> list_map = [];
  final _text_name = TextEditingController();
  final _text_phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    informationProviderviewModel = context.read();
    informationProviderviewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 200),
              () => {
            setState(() {
              list_map = informationProviderviewModel.list_map;
              groupValue = informationProviderviewModel.list.indexWhere((e) => e.q6_New == 1) + 1;
              stt = informationProviderviewModel.list.lastWhere((e) => e.q6_New == 1).idtv ?? 0;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        title: const UIText(
          text: UIDescribes.interviewDetails,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
        actions: const [
          UIGPSButton(),
          UIEXITButton()
        ],
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const UIText(
                      text: "Chọn người cung cấp thông tin",
                      textColor: Colors.black,
                      textFontSize: fontGreater,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    const SizedBox(height: 10,),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list_map.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: UIText(
                            text: list_map[index].keys.toString(),
                            textColor: Colors.black,
                            textFontSize: fontLarge,
                            textAlign: TextAlign.start,
                            isBold: false,
                          ),
                          leading: RoundCheckBox(
                            isChecked: groupValue == list_map[index].values.first ? true : false,
                            onTap: (selected) {
                              setState(() {
                                groupValue = groupValue == list_map[index].values.first ? 0 : list_map[index].values.first;
                                stt = list_map[index].values.first;
                              });
                            },
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            checkedColor: Colors.white,
                            checkedWidget: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                            uncheckedColor: Colors.white,
                            uncheckedWidget: Container(),
                          ),
                          onTap: (){
                            setState(() {
                              groupValue = groupValue == list_map[index].values.first ? 0 : list_map[index].values.first;
                              stt = list_map[index].values.first;
                            });
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10,),
                    Visibility(
                      visible: groupValue == 87,
                      child: const UIText(
                        text: "Tên người cung cấp thông tin",
                        textColor: Colors.black,
                        textFontSize: fontGreater,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Visibility(
                      visible: groupValue == 87,
                      child: TextFormField(
                        controller: _text_name,
                        autofocus: true,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Vui lòng nhập tên';
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
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: mPrimaryColor)),
                          hintText: "Nhập họ và tên",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const UIText(
                      text: "Xin ông bà cho biết số điện thoại cố định/di động của hộ:",
                      textColor: Colors.black,
                      textFontSize:fontGreater,
                    ),
                    const SizedBox(height: 5,),
                    TextFormField(
                      controller: _text_phone,
                      maxLength: 15,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Vui lòng nhập số điện thoại';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      autofocus: true,
                      style: const TextStyle(color: Colors.black, fontSize: fontMedium),
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          counterText: ''
                      ),
                    ),
                  ]),
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
                          informationProviderviewModel.InformationProviderBack();
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
                          if(_formKey.currentState!.validate()){
                            if(groupValue == 0){
                              showDialog(
                                  context: context,
                                  builder: (_) => const UIWarningDialog(waring: 'Người cung cấp thông tin nhập vào chưa đúng!')
                              );
                            }
                            else if (_text_phone.text.length < 10){
                              showDialog(
                                  context: context,
                                  builder: (_) => const UIWarningDialog(waring: 'Số điện thoại nhập vào phải có 10 ký số (nếu là di động), 11 hoặc 12 ký số (nếu là cố định)'));
                            } else if(_text_phone.text.isNotEmpty &&  _text_phone.text.substring(0,1) != '0'){
                              showDialog(
                                  context: context,
                                  builder: (_) => const UIWarningDialog(waring: 'Số điện thoại phải bắt đầu là 0'));
                            }
                            else if(_text_name.text.length < 5){
                              showDialog(
                                  context: context,
                                  builder: (_) => UINotificationDialog(
                                      notification: 'Họ tên người cung cấp thông tin nhỏ hơn 5 ký tự có đúng không?',
                                      onpress: (){
                                        Navigator.of(context).pop();
                                        setState(() {

                                          _text_name.text = "";
                                        });
                                      }
                                  )
                              );
                            }
                            else {
                              informationProviderviewModel.InformationProviderNext(_text_phone.text, stt.toString());
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
      drawer: const DrawerNavigation(),
    );
  }
}