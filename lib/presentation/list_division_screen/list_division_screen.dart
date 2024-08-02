import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/image_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListDivisionScreen extends StatefulWidget {
  const ListDivisionScreen({super.key});

  @override
  State<ListDivisionScreen> createState() => _ListDivisionScreenState();
}

class _ListDivisionScreenState extends State<ListDivisionScreen> {
  int? routeArguments;
  DateTime selectedDate = DateTime.now();
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  List<DateTime?> _dates = [];
  List<DateTime?> _dates_absent = [];
  ListDivisionController controller = Get.put(ListDivisionController());
  
  List<dynamic>? dataMember;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initData();
  }

  // initData() async {
  //   setState(() {
  //     routeArguments = ModalRoute.of(context)?.settings.arguments as int?;
  //   });
  // print(routeArguments);

  //   var result = await _fetchMemberData();
  //   setState(() {
  //     dataMember = result;
  //   });
  //   // print(dataMember);
  // }

  // Future<List<dynamic>> _fetchMemberData() async {
  //   homeController = Get.put(HomeController());
  //   String dateTimeString = '$selectedDate';
  //   int lastIndex = dateTimeString.lastIndexOf(" ");
  //   String formatedDate = dateTimeString.substring(0, lastIndex);

  //   Map<String, dynamic> result =
  //       await homeController!.getListBelumAbsen(formatedDate, routeArguments!);
  //   List<dynamic> listMemberData = result['details']['data'];
  //   // print(listMemberData);
  //   return listMemberData;
  // }

  @override
  Widget build(BuildContext context) {
    // print(selectedDate);
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            height: getVerticalSize(81),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 29, bottom: 28),
                onTap: () {
                  onTapArrowleft11();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Attendence Log".tr),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              _calendar(),
              _listMember(),
            ],
          )),
    );
  }

  Widget _listMember() {
    return Container(
      margin: getMargin(left: 10, right: 10),
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (context, ScrollController scrollController) => ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getHorizontalSize(25)),
            topRight: Radius.circular(getHorizontalSize(25)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              border: Border.all(
                color: ColorConstant.gray300, // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getHorizontalSize(25)),
                topRight: Radius.circular(getHorizontalSize(25)),
              ),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Column(
                  children: [
                    Container(
                      margin: getPadding(top: 10),
                      height: getVerticalSize(3),
                      width: getHorizontalSize(50),
                      color: ColorConstant.gray300,
                    ),
                    Container(
                      margin: getMargin(top: 20, left: 15, right: 15),
                      padding: getPadding(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(getHorizontalSize(8)),
                        border: Border.all(color: ColorConstant.gray300),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: "All Activity",
                        items: [
                          DropdownMenuItem<String>(
                            value: 'All Activity',
                            child: Text(
                              'All Activity | 4',
                              style: TextStyle(fontSize: getFontSize(16)),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Not Clock In',
                            child: Text(
                              'Not Clock In | 0',
                              style: TextStyle(fontSize: getFontSize(16)),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'All Leave',
                            child: Text(
                              'All Leave | 0',
                              style: TextStyle(fontSize: getFontSize(16)),
                            ),
                          ),
                        ],
                        onChanged: (newValue) {},
                      ),
                    ),
                  ],
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: dataMember!.length,
                //   itemBuilder: (context, index) {
                //     final employee = dataMember![index];

                //     final clockOut = !employee['jam_keluar'].isEmpty
                //         ? employee['jam_keluar'].last['jam_absen']
                //         : '00:00';
                //     final clockIn = !employee['jam_masuk'].isEmpty
                //         ? employee['jam_masuk'][0]['jam_absen']
                //         : '00:00';

                //     String jamClockIn = '00:00';
                //     if (clockIn != '00:00') {
                //       DateTime dateTimeMasuk = DateTime.parse(clockIn).toLocal();
                //       jamClockIn =
                //           DateFormat.Hm().format(dateTimeMasuk).toString();
                //     }

                //     String jamClockOut = '00:00';
                //     if (clockOut != '00:00') {
                //       DateTime dateTimeKeluar =
                //           DateTime.parse(clockOut).toLocal();
                //       jamClockOut =
                //           DateFormat.Hm().format(dateTimeKeluar).toString();
                //     }

                //     return Column(
                //       children: [
                //         Container(
                //           margin:
                //               getPadding(left: 16, right: 16, top: 5, bottom: 5),
                //           child: ListTile(
                //             contentPadding: getPadding(top: 8, bottom: 8),
                //             leading: CircleAvatar(
                //               radius: getHorizontalSize(23),
                //               backgroundImage: NetworkImage(employee['image']),
                //             ),
                //             title: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   employee['nama'],
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: getFontSize(16),
                //                   ),
                //                 ),
                //                 Text(
                //                   employee['divisi'],
                //                   style: TextStyle(
                //                     fontWeight: FontWeight.w300,
                //                     fontSize: getFontSize(12),
                //                   ),
                //                 ),
                //                 Row(
                //                   children: [
                //                     Row(
                //                       children: [
                //                         Icon(
                //                           MdiIcons.clockTimeSevenOutline,
                //                           size: getFontSize(18),
                //                           color: ColorConstant.green600,
                //                         ),
                //                         Text(
                //                           ' $jamClockIn',
                //                           style: TextStyle(
                //                             fontSize: getFontSize(15),
                //                             color: jamClockIn == '00:00'
                //                                 ? ColorConstant.red
                //                                 : ColorConstant.black900,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(width: getHorizontalSize(40)),
                //                     Row(
                //                       children: [
                //                         Icon(
                //                           MdiIcons.clockTimeFourOutline,
                //                           size: getFontSize(18),
                //                           color: ColorConstant.yellow50,
                //                         ),
                //                         Text(
                //                           ' $jamClockOut',
                //                           style: TextStyle(
                //                             fontSize: getFontSize(15),
                //                             color: jamClockOut == '00:00'
                //                                 ? ColorConstant.red
                //                                 : ColorConstant.black900,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         Divider(
                //           height: getVerticalSize(1),
                //         )
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _calendar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHorizontalSize(20)),
      ),
      margin: getMargin(left: 16, right: 16),
      padding: getPadding(left: 10, right: 10),
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              Column(
                children: [
                  Container(
                    height: getHorizontalSize(70),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstant.indigo800,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getHorizontalSize(20)),
                        topRight: Radius.circular(getHorizontalSize(20)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getVerticalSize(450),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(getHorizontalSize(20)),
                        bottomRight: Radius.circular(getHorizontalSize(20)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: getPadding(left: 5, right: 5),
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        weekdayLabelTextStyle: AppStyle.txtSubheadlineIndigo800,
                        weekdayLabels: day,
                        controlsTextStyle: AppStyle.txtSFProDisplaySemibold20,
                        customModePickerIcon: CustomImageView(
                            svgPath: ImageConstant.imglastMonth,
                            height: getVerticalSize(17),
                            width: getHorizontalSize(12),
                            margin: getMargin(left: 8, top: 4, bottom: 4)),
                        lastMonthIcon: CustomImageView(
                            svgPath: ImageConstant.imgPreviousMonth,
                            height: getVerticalSize(17),
                            width: getHorizontalSize(12),
                            color: ColorConstant.whiteA700,
                            margin: getMargin(left: 8, top: 4, bottom: 4)),
                        nextMonthIcon: CustomImageView(
                            svgPath: ImageConstant.imglastMonth,
                            height: getVerticalSize(17),
                            width: getHorizontalSize(12),
                            color: ColorConstant.whiteA700,
                            margin: getMargin(left: 8, top: 4, bottom: 4)),
                        dayTextStyle: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(20),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                        selectedDayHighlightColor: ColorConstant.indigo800,
                        selectedDayTextStyle: AppStyle.txtSFProDisplaySemibold20
                            .copyWith(letterSpacing: getHorizontalSize(0.38)),
                      ),
                      value: _dates,
                      onValueChanged: (dates) {
                        _dates_absent = dates;
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                right: getHorizontalSize(10),
                top: getVerticalSize(
                    450), // Adjust this value to move the button up or down
                child: ElevatedButton(
                  onPressed: () async {
                    // Your onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.indigo800,
                  ),
                  child: Text(
                    'Today',
                    style: TextStyle(color: ColorConstant.whiteA700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

onTapArrowleft11() {
  Get.back();
}
