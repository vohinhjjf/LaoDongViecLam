import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import 'not_interview_viewmodel.dart';

class NotInterviewedView extends StatefulWidget {
  const NotInterviewedView({Key? key}) : super(key: key);

  @override
  State<NotInterviewedView> createState() => _NotInterviewedViewState();
}

class _NotInterviewedViewState extends State<NotInterviewedView> {
  late NotInterviewedViewModel notInterviewedViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  final _text_find = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notInterviewedViewModel = context.read();
      notInterviewedViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = notInterviewedViewModel.data;
          for(var item in notInterviewedViewModel.bangKeThangDTModel.where((e) => e.trangThai == 9 || e.trangThai == 8).toList()){
            listBangKeCs.removeWhere((e) => e.idho == item.idhO_BKE);
          }
        })
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mPrimaryColor,
              size: fontMedium,
            ),
            onPressed: () => notInterviewedViewModel.notInterviewedBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.unInterviewedList,
          textColor: mPrimaryColor,
          textAlign: TextAlign.center,
          textFontSize: fontLarge,
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: UITextFormField(
                controller: _text_find,
                onChanged: (text){
                  setState(() {
                    notInterviewedViewModel.searchData(text).then((value) {
                      listBangKeCs = value;
                    });
                  });
                },
                hint: "Nhập từ khóa tìm kiếm",
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: listBangKeCs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      notInterviewedViewModel.notInterviewed(listBangKeCs[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: _item(listBangKeCs[index]),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(BangKeCsModel bangKeCsModel) {
    print(bangKeCsModel.trangthai_BK);
    String trangThai = "CHƯA PHỎNG VẤN";
    Color textColor = Colors.black;
    if(bangKeCsModel.trangthai_BK == 5){
      trangThai = "ĐANG PHỎNG VẤN";
      textColor = Colors.amber.shade800;
    } else if(bangKeCsModel.trangthai_BK == 6){
      trangThai = "HỘ CHUYỂN ĐI - ĐẾN";
      textColor = Colors.amber.shade800;
    }
    return UIRichText(
      text1: "",
      text2: "${bangKeCsModel.hoSo} : $trangThai - ${bangKeCsModel.tenChuHo}",
      text3: " - ${bangKeCsModel.diaChi}",
      textColor: textColor,
      textFontSize: fontLarge,
    );
  }
}