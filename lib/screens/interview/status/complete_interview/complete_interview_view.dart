import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangkeThangDT_model.dart';
import '../../../../models/bangke_model.dart';
import 'complete_interview_viewmodel.dart';

class CompleteInterviewView extends StatefulWidget {
  const CompleteInterviewView({Key? key}) : super(key: key);

  @override
  State<CompleteInterviewView> createState() => _CompleteInterviewViewState();
}

class _CompleteInterviewViewState extends State<CompleteInterviewView> {
  late CompleteInterviewViewModel completeInterviewViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  List<BangKeThangDTModel> listBangKeThangDTModel = [];
  final _text_find = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      completeInterviewViewModel = context.read();
      completeInterviewViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = completeInterviewViewModel.data;
          listBangKeThangDTModel = completeInterviewViewModel.bangKeThangDTModel.where((e) => e.trangThai == 3 || e.trangThai == 9).toList();
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
            onPressed: () => completeInterviewViewModel.CompleteInterviewBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.completeInterviewed,
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
              child: TextField(
                controller: _text_find,
                onChanged: (text){
                  setState(() {
                    //CompleteInterviewViewModel.searchData(text).then((value) => listBangKeCs = value);
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: mPrimaryColor)),
                  hintText: "Nhập từ khóa tìm kiếm",
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: listBangKeThangDTModel.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      completeInterviewViewModel.CompleteInterview(listBangKeThangDTModel[index]);
                      print(listBangKeThangDTModel[index].idhO_BKE);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: _item(listBangKeThangDTModel[index]),
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

  Widget _item(BangKeThangDTModel bangKeThangDTModel) {
    BangKeCsModel bangKeCsModel = listBangKeCs.singleWhere((e) => e.idho == bangKeThangDTModel.idhO_BKE);
    return UIRichText(
      text1: "",
      text2: "${bangKeCsModel.hoSo} : HOÀN THÀNH PHỎNG VẤN - ${bangKeCsModel.tenChuHo}",
      text3: " - ${bangKeCsModel.diaChi}",
      textColor: bangKeThangDTModel.trangThai == 3 ? Colors.black : mCompleteColor,
      textFontSize: fontLarge,
    );
  }
}