import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../base/base_logic.dart';
import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P35_viewmodel.dart';

class P35View extends StatefulWidget {
  const P35View({Key? key}) : super(key: key);

  @override
  State<P35View> createState() => _P35ViewState();
}

class _P35ViewState extends State<P35View> {
  late P35ViewModel p35ViewModel;
  final _formKey = GlobalKey<FormState>();
  final _orther = TextEditingController();
  var thanhvien = thongTinThanhVienModel();
  int p35 =0;
  bool check_draw = true;

  var _lydo = [
    "Quá già/quá trẻ",
    "Mất khả năng lao động",
    "Nội trợ",
    "Bận học (SV/HS/học việc)",
    "Không muốn/không cần đi làm",
    "Tin là không có việc/không có việc thích hợp",
    "Không biết tìm ở đâu/bằng cách nào",
    "Tạm nghỉ do thu hẹp/ngừng sản xuất",
    "Đợi việc/đợi khai trương HĐKD",
    "Nghỉ thời vụ",
    "Thời tiết xấu/thiên tai",
    "Do dịch bệnh",
    "Bận việc gia đình/đang nghỉ ngơi",
    "Làm nông nghiệp",
    "Ốm/đau tạm thời",
    "Khác (Ghi cụ thể)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p35ViewModel = context.read();
      p35ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p35ViewModel.thanhvien;
              p35 = p35ViewModel.thanhvien.c31 ?? 0;
              _orther.text = p35ViewModel.thanhvien.c31K.toString();
            })
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
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: mPrimaryColor),
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.informationCommon,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //p35
                  UIRichText(
                    text1: "P35. Lý do chính mà ${BaseLogic.getInstance().getMember(thanhvien)} ",
                    text2: thanhvien.c00 ?? "",
                    text3: " không tìm việc trong 30 ngày qua là gì?",
                    textColor: Colors.black,
                    textFontSize:fontLarge,
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _lydo.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: UIText(
                          text: _lydo[index].toString(),
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        leading: RoundCheckBox(
                          isChecked: p35 == index+1 ? true : false,
                          onTap: (selected) {
                            setState(() {
                              p35 = p35 == index+1 ? 0 : index+1;
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
                        onTap: () {
                          setState(() {
                            p35 = p35 == index+1 ? 0 : index+1;
                          });
                        },
                      );
                    },
                  ),
                  Visibility(
                    visible: p35 == 16 ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        const UIText(
                          text: "Lý do khác",
                          textColor: Colors.black,
                          textFontSize: fontMedium,
                          textAlign: TextAlign.start,
                          isBold: false,
                        ),
                        const SizedBox(height: 5,),
                        UITextFormField(
                          autofocus: true,
                          controller: _orther,
                          validator: (value){
                            if(p35 == 16 && value!.isEmpty){
                              return 'Vui lòng nhập lý do';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '[a-z A-Z á-ý Á-Ý à-ỳ À-Ỳ ã-ỹ Ã-Ỹ ả-ỷ Ả-Ỷ ạ-ỵ Ạ-Ỵ]')),
                            FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  //Button
                  const SizedBox(height: 90,),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UIBackButton(ontap: (){
              p35ViewModel.P35Back();
            }),
            UINextButton(ontap: (){
              if(_formKey.currentState!.validate()) {
                if (p35 == 0) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                      const UIWarningDialog(
                        waring: 'P35-Lý do không tìm việc nhập vào chưa đúng!',)
                  );
                }
                else if (p35 == 9 && thanhvien.c30 == 2) {
                  showDialog(
                      context: context,
                      builder: (_) =>
                      const UIWarningDialog(
                        waring: 'P35-Lý do không tìm việc là đợi việc/đợi khai trương HĐKD mà C32 = 2!',)
                  );
                }
                else {
                  p35ViewModel.P35Next(thongTinThanhVienModel(
                    idho: thanhvien.idho,
                    idtv: thanhvien.idtv,
                    c31: p35,
                    c31K: _orther.text,
                  ));
                }
              }
            }),
          ],
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: check_draw
              ? DrawerNavigationThanhVien(onTap: (){
            setState(() {
              check_draw = false;
            });
          },)
              : const DrawerNavigation()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}