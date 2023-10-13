import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
                          p43ViewModel.P43Back();
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
    );
  }
}