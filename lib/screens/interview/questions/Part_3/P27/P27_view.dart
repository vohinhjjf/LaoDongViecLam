import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P27_viewmodel.dart';

class P27View extends StatefulWidget {
  const P27View({Key? key}) : super(key: key);

  @override
  State<P27View> createState() => _P27ViewState();
}

class _P27ViewState extends State<P27View> {
  late P27ViewModel p27ViewModel;
  var thanhvien = thongTinThanhVienModel();
  var _tt = "đang tạm nghỉ";
  int p20 =0,p21 =0,p27 =0;

  var _nganh = [
    "TRỒNG TRỌT/CHĂN NUÔI",
    "THỦY SẢN",
    "LÂM NGHIỆP",
    "KHÁC",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p27ViewModel = context.read();
      p27ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p27ViewModel.thanhvien;
              p20 = p27ViewModel.thanhvien.c18 ?? 0;
              p21 = p27ViewModel.thanhvien.c19 ?? 0;
              p27 = p27ViewModel.thanhvien.c25 ?? 0;
            })
          });
    });
    if(p20 ==1 || p21 == 1){
      _tt = "đang làm";
    }
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
                //p27
                UIRichText(
                  text1: "P27. Công việc mà ",
                  text2: thanhvien.c00 ?? "",
                  text3: " $_tt thuộc ngành trồng trọt/chăn nuôi,"
                      " thủy sản, lâm nghiệp hay ngành khác?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                SizedBox(height: 10,),
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
                        isChecked: p27 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p27 = p27 == index+1 ? 0 : index+1;
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
                          p27 = p27 == index+1 ? 0 : index+1;
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
                          p27ViewModel.P27Back(thanhvien);
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
                          if(p27 == 0){
                            showDialog(
                                context: context,
                                builder: (_) => UIWarningDialog(waring: 'Thành viên ${thanhvien.c00} có P27 - Công việc thuộc ngành trồng trọt/chăn nuôi/thủy sản hay lâm nghiệp nhập vào chưa đúng!',)
                            );
                          }else {
                            p27ViewModel.P27Next(thongTinThanhVienModel(
                              idho: thanhvien.idho,
                              idtv: thanhvien.idtv,
                              c25: p27,
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
          child: const DrawerNavigationThanhVien()
      ),
      drawerScrimColor: Colors.transparent,
    );
  }
}