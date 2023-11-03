import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../components/uis.dart';
import '../../../../models/bangke_model.dart';
import 'backup_replace_viewmodel.dart';

class BackupReplaceView extends StatefulWidget {
  const BackupReplaceView({Key? key}) : super(key: key);

  @override
  State<BackupReplaceView> createState() => _BackupReplaceViewState();
}

class _BackupReplaceViewState extends State<BackupReplaceView> {
  late BackupReplaceViewModel backupReplaceViewModel;
  List<BangKeCsModel> listBangKeCs = [];
  final _text_find = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      backupReplaceViewModel = context.read();
      backupReplaceViewModel.onInit(context);
      Future.delayed(const Duration(milliseconds: 100), () => {
        setState((){
          listBangKeCs = backupReplaceViewModel.data;
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
            onPressed: () => backupReplaceViewModel.BackupReplaceBack()),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const UIText(
          text: UIDescribes.preventive,
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
                    //backupReplaceViewModel.searchData(text).then((value) => listBangKeCs = value);
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
              itemCount: listBangKeCs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      backupReplaceViewModel.BackupReplace(listBangKeCs[index]);
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
    return UIRichText(
      text1: "",
      text2: "${bangKeCsModel.hoSo} : HỘ DỰ PHÒNG - ${bangKeCsModel.tenChuHo}",
      text3: " - ${bangKeCsModel.diaChi}",
      textColor: Colors.black,
      textFontSize: fontLarge,
    );
  }
}