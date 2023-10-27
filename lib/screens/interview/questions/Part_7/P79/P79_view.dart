import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/doiSongHo_model.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P79_viewmodel.dart';

class P79View extends StatefulWidget {
  const P79View({Key? key}) : super(key: key);

  @override
  State<P79View> createState() => _P79ViewState();
}

class _P79ViewState extends State<P79View> {
  late P79ViewModel p79ViewModel;
  var thanhvien = thongTinThanhVienModel();
  var doisongho = DoiSongHoModel();
  int p79 = 0;

  var _thaydoi = [
    "TĂNG LÊN",
    "KHÔNG THAY ĐỔI",
    "GIẢM ĐI",
    "KHÔNG BIẾT",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p79ViewModel = context.read();
      p79ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p79ViewModel.thanhvien;
              doisongho = p79ViewModel.doisongho;
              p79 = p79ViewModel.doisongho.c62_M4 ?? 0;
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
          textFontSize: fontGreater,
          isBold: true,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(55, 25, 55, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p79
                UIRichText(
                  text1: "P79. So với tháng ${thanhvien.thangDT} của năm trước, thu nhập "
                      "hiện nay của hộ ${thanhvien.c02 == 1 ? "Ông" : "Bà"} ",
                  text2: thanhvien.c00 ?? "",
                  text3: " thay đổi như thế nào?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _thaydoi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _thaydoi[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p79 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p79 = p79 == index+1 ? 0 : index+1;
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
                          p79 = p79 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 790,
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
                          p79ViewModel.P79Back(doisongho);
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
                          if(p79 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P79 - Thu nhập hiện nay thay đổi như thế nào nhập vào chưa đúng!',)
                            );
                          }
                          else if((doisongho.c62_M2 == 1 && p79 == 3) || (doisongho.c62_M2 == 3 && p79 == 1)){
                            showDialog(
                                context: context,
                                builder: (_) => UINotificationDialog(
                                  notification: 'Thu nhập so tháng trước ${(doisongho.c62_M2 == 1 && p79 == 3) ? "tăng lên":"giảm đi"} mà thu nhập so năm trước lại ${(doisongho.c62_M2 == 1 && p79 == 3) ? "giảm đi":"tăng lên"}. Có đúng không?',
                                  onpress: (){
                                    Navigator.of(context).pop();
                                    p79ViewModel.P79Next(DoiSongHoModel(
                                        idho: doisongho.idho,
                                        c62_M4: p79
                                    ));
                                  },
                                )
                            );
                          }
                          else {
                            p79ViewModel.P79Next(DoiSongHoModel(
                                idho: doisongho.idho,
                                c62_M4: p79
                            ));
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