import 'package:fastteam_app/presentation/home_page/models/member_division_model.dart';
import 'package:fastteam_app/presentation/home_page/widgets/list_member_absent.dart';
import 'package:fastteam_app/presentation/home_page/widgets/list_member_division.dart';
import 'package:fastteam_app/presentation/home_page/widgets/menu_widget.dart';
import 'package:fastteam_app/widgets/custom_refresh_widget.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/populer_center_model.dart';
import 'models/recommended_model.dart';
import 'models/slidergroup_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'models/top_rated_model.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController(HomeModel().obs));
  List<SlidergroupItemModel> slider = HomeModel.getSlider();
  CarouselController carouselController = CarouselController();
  List<PopulerCenterData> populerlist = HomeModel.getPopulerData();
  List<RecommendedCenterData> recommendedList = HomeModel.getRecommendedData();
  List<TopRatedData> topRatedList = HomeModel.getTopRatedData();
  List<MemberDivisionData> memberData = HomeModel.getMemberDivision();

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
    print(controller.isFilter);
    if (controller.isFilter == false) {
      controller.getListBelumAbsen('', 0);
    }
    controller.listDivisi();
    controller.loadFilter(false);
  }

  void onSelected(String selectedValue) async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    int value = int.parse(selectedValue);
    controller.loadFilter(true);
    controller.getFilterBelumAbsen(formattedDate, value);
  }

  Future refreshItem() async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    controller.loadFilter(true);
    controller.getFilterBelumAbsen(formattedDate, 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    return RefreshWidget(
      onRefresh: refreshItem,
      child: Scaffold(
          backgroundColor: ColorConstant.gray5001,
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
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

            var employees = controller.filteredEmployees;

            var memberDivision = controller.memberEmployees;

            return SafeArea(
              child: ListView(
                children: [
                  SafeArea(
                    child: Container(
                      decoration: AppDecoration.white,
                      child: Padding(
                        padding: getPadding(top: 20, left: 20, right: 20),
                        child: CustomAppBar(
                            styleType: Style.bgHeight44,
                            height: getVerticalSize(80),
                            leadingWidth: 40,
                            title: Padding(
                                padding: getPadding(left: 0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: getPadding(right: 141),
                                          child: Text(
                                            "${nama}".tr,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtHeadline,
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: getPadding(top: 5),
                                              child: Text("$divisi".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFProDisplayRegular16Black900)))
                                    ])),
                            actions: [
                              CustomImageView(
                                  url: '$imgUrl',
                                  height: getSize(50),
                                  width: getSize(50),
                                  radius: BorderRadius.circular(
                                      getHorizontalSize(60)),
                                  alignment: Alignment.center),
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    decoration: AppDecoration.white,
                    child: Padding(
                      padding: getPadding(bottom: 16, top: 10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: getVerticalSize(220),
                                width: getHorizontalSize(500),
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(all: 20),
                                  child: Container(
                                    padding: getPadding(left: 20),
                                    height: getVerticalSize(180),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.indigo800,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(20)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 30,
                                          ),
                                          child: Text(
                                            "$kantor",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFProDisplaySemibold20,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 1,
                                          ),
                                          child: Text(
                                            "${DateFormat('d MMM yyyy').format(DateTime.now())} (${shift == '00:00 - 00:00' ? 'No Shift' : shift})",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtBodyWhite,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(top: 25),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(10)),
                                            ),
                                            height: getVerticalSize(50),
                                            width: getHorizontalSize(350),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly, // Untuk memberi jarak yang sama antara elemen
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.canAbsent(true)
                                                          ? _clockIn(context)
                                                          : null;
                                                    },
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                                right: 8),
                                                            child: Icon(
                                                                Icons.input,
                                                                color: controller
                                                                        .canAbsent(
                                                                            true)
                                                                    ? ColorConstant
                                                                        .black900
                                                                    : ColorConstant
                                                                        .gray300),
                                                          ),
                                                          Text(
                                                            "Clock In",
                                                            style: controller
                                                                    .canAbsent(
                                                                        true)
                                                                ? AppStyle
                                                                    .txtSFProDisplaySemibold18
                                                                : AppStyle
                                                                    .txtSFProDisplaySemibold18Gray,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                      top: 5, bottom: 5),
                                                  child: Container(
                                                    width:
                                                        1, // Lebar garis pembatas
                                                    color: Colors
                                                        .grey, // Warna garis pembatas
                                                  ),
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller
                                                              .canAbsent(false)
                                                          ? _clockOut(context)
                                                          : null;
                                                    },
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                                right: 8),
                                                            child: Icon(
                                                                Icons.output,
                                                                color: controller
                                                                        .canAbsent(
                                                                            false)
                                                                    ? ColorConstant
                                                                        .black900
                                                                    : ColorConstant
                                                                        .gray300),
                                                          ),
                                                          Text(
                                                            "Clock Out",
                                                            style: controller
                                                                    .canAbsent(
                                                                        false)
                                                                ? AppStyle
                                                                    .txtSFProDisplaySemibold18
                                                                : AppStyle
                                                                    .txtSFProDisplaySemibold18Gray,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            MenuWidget(),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  listDivision(context, memberDivision),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  listMemberAbsent(context, memberData, employees, onSelected,
                      controller.valueDivisi.value),
                ],
              ),
            );
          })),
    );
  }

  void _clockIn(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Izin lokasi ditolak oleh pengguna.'),
        ),
      );
    } else {
      Get.toNamed(AppRoutes.map, arguments: 'in');
    }
  }

  void _clockOut(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Izin lokasi ditolak oleh pengguna.'),
        ),
      );
    } else {
      Get.toNamed(AppRoutes.map, arguments: 'out');
    }
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.popularCentersScreen,
    );
  }

  onTapColumnrectangle() {
    Get.toNamed(
      AppRoutes.serviceDetailScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.recommendedForYouScreen,
    );
  }

  onTapColumnrectangle1() {
    Get.toNamed(
      AppRoutes.serviceDetailScreen,
    );
  }

  onTapTxtViewalltwo() {
    Get.toNamed(
      AppRoutes.topRatedScreen,
    );
  }

  onTapColumnrectangle2() {
    Get.toNamed(
      AppRoutes.serviceDetailScreen,
    );
  }
}
