import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P28_viewmodel.dart';

class P28View extends StatefulWidget {
  const P28View({Key? key}) : super(key: key);

  @override
  State<P28View> createState() => _P28ViewState();
}

class _P28ViewState extends State<P28View> {
  late P28ViewModel p28ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p28 =0;

  var _nganh = [
    "CHỈ ĐỂ BÁN",
    "CHỦ YẾU ĐỂ BÁN",
    "CHỈ ĐỂ GIA ĐÌNH DÙNG",
    "CHỦ YẾU ĐỂ GIA ĐÌNH DÙNG",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p28ViewModel = context.read();
      p28ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p28ViewModel.thanhvien;
              p28 = p28ViewModel.thanhvien.c26 ?? 0;
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
                //p28
                UIRichText(
                  text1: "P28. Mục đích chủ yếu của các sản phẩm ",
                  text2: thanhvien.c00 ?? "",
                  text3: " sản xuất ra từ công việc này là để bán hay để gia đình sử dụng?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _nganh.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _nganh[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p28 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p28 = p28 == index+1 ? 0 : index+1;
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
                          p28 = p28 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
              ],
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
                          p28ViewModel.P28Back(thanhvien.c24);
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
                          if(p28 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P28 - Mục đích chủ yếu của sản xuất từ công việc chính nhập vào chưa đúng!',)
                            );
                          }else {
                            p28ViewModel.P28Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c26: p28,
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
          child: DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}