import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/profile_details_screen/controller/profile_details_controller.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  ProfileDetailsController controller = Get.put(ProfileDetailsController());

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
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.retriveAccountInformation();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
            backgroundColor: ColorConstant.gray5001,
            appBar: CustomAppBar(
              height: getVerticalSize(81),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    onTapArrowleft18();
                  }),
              actions: [
                AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgTicket,
                    margin: getMargin(left: 16, top: 29, right: 16, bottom: 28),
                    onTap: () {
                      onTapTicket();
                    })
              ],
              centerTitle: true,
              title: AppbarTitle(text: "lbl_profile_details".tr),
            ),
            body: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              email = controller.accountModel.email;
              fullname = controller.accountModel.fullName;
              divisiName = controller.accountModel.divisi;
              jenisKelamin = controller.accountModel.gender;
              tempatLahir = controller.accountModel.tempatLahir;
              tanggalLahir = controller.accountModel.tanggalLahir;
              noHp = controller.accountModel.nomorHp;
              statusPerinkahan = controller.accountModel.statusKawin;
              agama = controller.accountModel.agama;
              nomorID = controller.accountModel.nomorKtp;
              alamatIdentitas = controller.accountModel.alamatKtp;
              alamatTinggal = controller.accountModel.alamatTinggal;

              return Container(
                width: double.maxFinite,
                margin: getMargin(top: 6),
                padding: getPadding(left: 16, right: 16),
                decoration: AppDecoration.white,
                child: ListView(
                  children: [
                    profile_detail_option("Name", fullname),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Email", email),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Phone Number", noHp),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Division", divisiName),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Gender", jenisKelamin),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Place of Birth", tempatLahir),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Date of Birth", tanggalLahir),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Marital Status", statusPerinkahan),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Religion", agama),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("ID Number", nomorID.toString()),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Identity Address", alamatIdentitas),
                    Padding(
                      padding: getPadding(top: 14, bottom: 21),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray5001,
                        endIndent: getHorizontalSize(22),
                      ),
                    ),
                    profile_detail_option("Residential Address", alamatTinggal),
                  ],
                ),
              );
            })),
      ),
    );
  }

  onTapArrowleft18() {
    Get.back();
  }

  Widget profile_detail_option(title, text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: getPadding(
              left: 16,
              top: 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBodyGray600,
                ),
                Padding(
                  padding: getPadding(
                    top: 11,
                  ),
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  onTapTicket() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
