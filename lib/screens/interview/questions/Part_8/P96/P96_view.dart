import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lao_dong_viec_lam/models/dichVuTaiChinh_model.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../components/uis.dart';
import '../../../../../models/thongTinThanhVien_model.dart';
import 'P96_viewmodel.dart';

class P96View extends StatefulWidget {
  const P96View({Key? key}) : super(key: key);

  @override
  State<P96View> createState() => _P96ViewState();
}

class _P96ViewState extends State<P96View> {
  late P96ViewModel p96ViewModel;
  thongTinThanhVienModel thanhvien = thongTinThanhVienModel();
  final _other_96 = TextEditingController();
  var list_p96 = [0,0,0,0,0,0,0,0];
  

  final Map<String, int> _nguon = {
    "Từ Ngân hàng (ngân hàng thương mại/Ngân hàng Chính sách xã hội/Ngân hàng Hợp tác xã)": 1,
    "Từ các tổ chức tín dụng phi ngân hàng: công ty tài chính, công ty cho thuê "
        "tài chính, công ty tài chính tiêu dùng; quỹ tín dụng nhân dân; tổ chức tài chính vi mô": 2,
    "Từ gia đình, họ hàng hay bạn bè, cơ quan, đồng nghiệp": 3,
    "Từ bên cho vay tư nhân/không chính thức (hụi, họ, cầm đồ, cho vay nặng lãi)": 4,
    "Từ các bên cho vay trong cộng đồng mang tính chất tương hỗ, thiện nguyện (nhà thờ, quỹ khuyến học.)": 5,
    "Từ bên mua/bán các sản phẩm nông nghiệp": 6,
    "Từ các tổ chức chính trị xã hội (Hội nông dân, Hội phụ nữ, Đoàn thanh niên, Hội cựu chiến binh.)": 7,
    "Nguồn khác, ghi rõ": 8,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      p96ViewModel = context.read();
      p96ViewModel.onInit(context);
      Future.delayed(
          const Duration(milliseconds: 100),
              () => {
            setState(() {
              thanhvien = p96ViewModel.thanhvien;
              list_p96 = p96ViewModel.list_p96;
              _other_96.text = p96ViewModel.dichVuTaiChinhModel.c96K ?? "";
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
                //p96
                UIRichText(
                  text1: "P96. ",
                  text2: thanhvien.c00 ?? "",
                  text3: " vay từ 1 triệu đồng trở lên từ "
                      "nguồn nào sau đây? (Có thể lựa chọn hơn 1 đáp án)",
                  textColor: Colors.black,
                  textFontSize:fontLarge,
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _nguon.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: UIText(
                        text: _nguon.keys.elementAt(index),
                        textColor: Colors.black,
                        textFontSize: fontLarge,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      leading: GFRadio(
                        type: GFRadioType.custom,
                        size: GFSize.LARGE,
                        activeBorderColor: Colors.black,
                        activeIcon: const Icon(Icons.check, size: 30, color: GFColors.PRIMARY),
                        value: _nguon.values.elementAt(index),
                        groupValue: list_p96[index],
                        onChanged: (value) {
                          setState(() {
                            if(list_p96.contains(value)){
                              list_p96.fillRange(index, index+1, 0);
                            } else {
                              list_p96.fillRange(index, index+1, value);
                            }
                          });
                        },
                        inactiveIcon: null,
                        radioColor: Colors.indigo,
                      ),
                      onTap: (){
                        setState(() {
                          if(list_p96.contains(_nguon.values.elementAt(index))){
                            list_p96.fillRange(index, index+1, 0);
                          } else {
                            list_p96.fillRange(index, index+1, _nguon.values.elementAt(index));
                          }
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: list_p96[list_p96.length-1] == 8 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UIText(
                        text: "Nguồn khác",
                        textColor: Colors.black,
                        textFontSize: fontMedium,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      const SizedBox(height: 5,),
                      TextFormField(
                        autofocus: true,
                        controller: _other_96,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Vui lòng nhập nguồn khác';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              '[a-z A-Z á-ứ Á-Ứ à-ừ À-Ừ ã-ữ Ã-Ữ ả-ử Ả-Ử ạ-ự Ạ-Ự]')),
                          FilteringTextInputFormatter.deny(RegExp('[×÷]')),
                        ],
                        keyboardType: TextInputType.text,
                        style: const TextStyle( color: Colors.black),
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular( 8.r)),
                        ),
                      )
                    ],
                  ),
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
                          p96ViewModel.P96Back();
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
                          String p96 = "";
                          for(int i = 0; i < list_p96.length; i++){
                            if(list_p96[i] != 0){
                              p96 = '$p96,${list_p96[i]}';
                            }
                          }
                          p96ViewModel.P96Next(DichVuTaiChinhModel(
                            idho: thanhvien.idho,
                            idtv: thanhvien.idtv,
                            c96: p96.replaceFirst(RegExp(r','), ''),
                            c96K: _other_96.text
                          ));
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