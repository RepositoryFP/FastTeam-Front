import 'package:fastteam_app/presentation/home_page/controller/home_controller.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../log_out_screen/log_out_screen.dart';
import 'controller/profile_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeController controller = Get.put(HomeController(HomeModel().obs));
  var idUser;
  var email;
  int? idDivisi;
  int? id_level;
  var nama;
  var fullNama;
  var divisi;
  var posLong;
  var posLat;
  var imgProf;
  var imgUrl;
  var lat;
  var long;
  var kantor;
  var masukAwal;
  var masukAkhir;
  var keluarAwal;
  var keluarAkhir;
  var avatarImageUrl;
  var shift;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.getAccountInformation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray5001,
        appBar: CustomAppBar(
          height: getVerticalSize(81),
          leadingWidth: 40,
          centerTitle: true,
          title: AppbarTitle(text: "lbl_profile".tr),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            idUser = controller.accountInfo!.id;
            nama = controller.accountInfo!.fullName;
            divisi = controller.accountInfo!.divisi;
            idDivisi = controller.accountInfo!.id_divisi;
            id_level = controller.accountInfo!.id_level;
            imgUrl = controller.accountInfo!.imgProfUrl;
            kantor = controller.accountInfo!.cabang;
            masukAwal = controller.accountInfo!.masukAwal;
            masukAkhir = controller.accountInfo!.masukAkhir;
            keluarAwal = controller.accountInfo!.keluarAwal;
            keluarAkhir = controller.accountInfo!.keluarAkhir;
            shift = controller.accountInfo!.shift;

            print('test');

            return Container(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getVerticalSize(8),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Container(
                      padding: getPadding(left: 20, right: 20, top: 10),
                      decoration: AppDecoration.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                  url: "${imgUrl}",
                                  height: getSize(100),
                                  width: getSize(100),
                                  radius: BorderRadius.circular(
                                      getHorizontalSize(60)),
                                  alignment: Alignment.center),
                              Padding(
                                  padding: getPadding(
                                    top: 5,
                                    left: 18,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: getHorizontalSize(250),
                                        child: Text("${nama}",
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFProTextbold20),
                                      ),
                                      Container(
                                        width: getHorizontalSize(250),
                                        child: Text("${divisi}".tr,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFProDisplayRegular17Black900),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: AppDecoration.white,
                      child: Padding(
                        padding: getPadding(left: 16, right: 16, top: 40),
                        child: Column(
                          children: [
                            profileOption(() {
                              Get.toNamed(AppRoutes.profileDetailsScreen);
                            }, ImageConstant.imgUser, "lbl_profile".tr),
                            profileOption(() {
                              // controller.setPamentMethodNavigation(true);
                              Get.toNamed(AppRoutes.profileDetailsScreen);
                            }, ImageConstant.imgSave, "Sertificate"),
                            profileOption(() {
                              Get.toNamed(AppRoutes.profileDetailsScreen);
                            }, ImageConstant.imgpayroll, "Payroll Info".tr),
                            profileOption(() {
                              Get.toNamed(AppRoutes.resetPasswordScreen);
                            }, ImageConstant.imgLock, "Change Password".tr),
                            profileOption(() {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    insetPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.zero,
                                    content: LogOutScreen(),
                                  );
                                },
                              );
                            }, ImageConstant.imgRefresh, "lbl_log_out".tr),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  onTapArrowleft12() {
    Get.back();
  }

  Widget profileOption(function, icon, title) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorConstant.gray300))),
        child: Padding(
          padding: getPadding(left: 16, top: 19, bottom: 19, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    svgPath: icon,
                    height: getSize(
                      22,
                    ),
                    width: getSize(
                      22,
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(16),
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ],
              ),
              CustomImageView(
                svgPath: ImageConstant.imgArrowright,
                height: getSize(
                  18,
                ),
                width: getSize(
                  18,
                ),
                margin: getMargin(
                  top: 2,
                  right: 6,
                  bottom: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
