import 'package:Fast_Team/controller/account_controller.dart';
import 'package:Fast_Team/model/account_information_model.dart';
import 'package:Fast_Team/model/user_model.dart';
import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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

  Future? _loadData;

  TextStyle alertErrorTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.white,
  );

  void initState() {
    super.initState();
    initConstructor();
    initData();
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

  initData() async {
    setState(() {
      _loadData = initializeState();
    });
  }

  Future<void> initializeState() async {
    await retriveAccountInformation();
  }

  retriveAccountInformation() async {
    AccountController accountController = Get.put(AccountController());
    var result = await accountController.retriveAccountInformation();
    AccountInformationModel accountModel =
        AccountInformationModel.fromJson(result['details']);
    email = accountModel.email;
    fullname = accountModel.fullName;
    divisiName.value = accountModel.divisi;
    jenisKelamin.value = accountModel.gender;
    tempatLahir.value = accountModel.tanggalLahir;
    tanggalLahir.value = accountModel.tanggalLahir;
    noHp.value = accountModel.nomorHp;
    statusPerinkahan.value = accountModel.statusKawin;
    agama.value = accountModel.agama;
    nomorID.value = accountModel.nomorKtp;
    alamatIdentitas.value = accountModel.alamatKtp;
    alamatTinggal.value = accountModel.alamatTinggal;
  }

  Future refreshItem() async {}
  @override
  Widget build(BuildContext context) {
    print(fullname);
    Widget listItems(title, subtitle, isLoading) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    color: ColorsTheme.darkGrey),
              ),
              SizedBox(height: 5.h),
              (!isLoading)
                  ? Shimmer.fromColors(
                      baseColor: ColorsTheme.secondary!,
                      highlightColor: ColorsTheme.lightGrey2!,
                      child: Container(
                        width: 150.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: ColorsTheme.white,
                        ),
                      ))
                  : Text(subtitle,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.sp,
                      )),
              Divider(
                height: 1.h,
              )
            ],
          ),
        );
    Widget contentBody(isLoading) {
      return RefreshWidget(
          onRefresh: refreshItem,
          child: Container(
            color: ColorsTheme.white,
            child: ListView(scrollDirection: Axis.vertical, children: [
              listItems('Nama Lengkap', '$fullname', isLoading),
              listItems('Email', '$email', isLoading),
              listItems('Jenis Kelamin', '$jenisKelamin', isLoading),
              listItems('Tempat Lahir', '$tempatLahir', isLoading),
              listItems('Tanggal Lahir', '$tanggalLahir', isLoading),
              listItems('Handphone', '$noHp', isLoading),
              listItems('Status Pernikahan', '$statusPerinkahan', isLoading),
              listItems('Agama', '$agama', isLoading),
              listItems('Nomor KTP', '$nomorID', isLoading),
              listItems('Alamat KTP', '$alamatIdentitas', isLoading),
              listItems('Alamat Tinggal', '$alamatTinggal', isLoading),
            ]),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit_square), onPressed: () {}),
        ],
      ),
      body: FutureBuilder(
        future: _loadData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return contentBody(false);
          } else if (snapshot.hasError) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              var snackbar = SnackBar(
                content: Text('Error: ${snapshot.error}',
                    style: alertErrorTextStyle),
                backgroundColor: ColorsTheme.lightRed,
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            });
            return contentBody(false);
          } else if (snapshot.hasData) {
            return contentBody(true);
          } else {
            return contentBody(true);
          }
        },
      ),
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
          title,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 12.sp),
        ),
        subtitle: Text(subtitle,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.sp,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
