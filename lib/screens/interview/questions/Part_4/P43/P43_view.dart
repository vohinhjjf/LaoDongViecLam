import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../components/navigation/drawer_navigation/drawer_navigation.dart';
import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P43_viewmodel.dart';

class P43View extends StatefulWidget {
  const P43View({Key? key}) : super(key: key);

  @override
  State<P43View> createState() => _P43ViewState();
}

class _P43ViewState extends State<P43View> {
  late P43ViewModel p43ViewModel;
  var thanhvien = thongTinThanhVienModel();
  int p43 = 0;
  bool check_draw = true;

  var _loaihinh = [
    "Hộ hoạt động nông, lâm nghiệp, thủy sản",
    "Cơ sở sản xuất kinh doanh cá thể (không phải hộ nông, lâm nghiệp, thủy sản",
    "Cá nhân làm tự do",
    "Hợp tác xã",
    "Doanh nghiệp do Nhà nước làm chủ",
    "Doanh nghiệp do tư nhân làm chủ",
    "Doanh nghiệp do nước ngoài làm chủ",
    "Đơn vị sự nghiệp nhà nước",
    "Đơn vị sự nghiệp ngoài nhà nước",
    "Cơ quan lập pháp/hành pháp/tư pháp",
    "Tổ chức chính trị - xã hội (Đảng, Đoàn thanh niên, Hội phụ nữ…)",
    "Tổ chức nước ngoài (hoạt động phi lợi nhuận)",
    "Tổ chức đoàn thể khác (Hiệp hội Dệt may. Hiệp hội Giày da Việt Nam…)",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p43ViewModel = context.read();
      p43ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p43ViewModel.thanhvien;
              p43 = p43ViewModel.thanhvien.c38 ?? 0;
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //p43
                UIRichText(
                  text1: "P43. Cơ sở nơi ",
                  text2: thanhvien.c00 ?? "",
                  text3: " làm việc thuộc loại hình nào sau đây?",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _loaihinh.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _loaihinh[index].toString(),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: RoundCheckBox(
                        isChecked: p43 == index+1 ? true : false,
                        onTap: (selected) {
                          setState(() {
                            p43 = p43 == index+1 ? 0 : index+1;
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
                          p43 = p43 == index+1 ? 0 : index+1;
                        });
                      },
                    );
                  },
                ),
                //Button
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIBackButton(ontap: (){
                      p43ViewModel.P43Back();
                    }),
                    UINextButton(ontap: (){
                      if(p43 == 0){
                        showDialog(
                            context: context,
                            builder: (_) => const UIWarningDialog(waring: 'P43 - Loại hình cơ sở nhập vào chưa đúng!',)
                        );
                      }
                      else {
                        p43ViewModel.P43Next(thongTinThanhVienModel(
                          idho: thanhvien.idho,
                          idtv: thanhvien.idtv,
                          c38: p43,
                        ));
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
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