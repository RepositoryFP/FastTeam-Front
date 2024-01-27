import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  var email;
  var nama;
  var fullname;
  var divisiName;
  var namaLokasi;
  var jenisKelamin;
  var tempatLahir;
  var tanggalLahir;
  var noHp;
  var statusPerinkahan;
  var agama;
  var nomorID;
  var alamatIdentitas;
  var alamatTinggal;

  void initState() {
    super.initState();
  }

  initConstructor() {
    email = ''.obs;
    nama = ''.obs;
    fullname = ''.obs;
    divisiName = ''.obs;
    namaLokasi = ''.obs;
    jenisKelamin = ''.obs;
    tempatLahir = ''.obs;
    tanggalLahir = ''.obs;
    noHp = ''.obs;
    statusPerinkahan = ''.obs;
    agama = ''.obs;
    nomorID = 0.obs;
    alamatIdentitas = ''.obs;
    alamatTinggal = ''.obs;
  }

  initData() async {}
  Future refreshItem() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit_square), onPressed: () {}),
        ],
      ),
      body: RefreshWidget(
          onRefresh: refreshItem,
          child: Container(
            color: ColorsTheme.white,
            child: ListView(scrollDirection: Axis.vertical, children: [
              itemList(
                title: 'nama',
                subtitle: 'nama nama',
              ),
            ]),
          )),
    );
  }
}

class itemList extends StatelessWidget {
  const itemList({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'nama',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 12.sp),
        ),
        subtitle: Text('nama nama',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.sp,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
