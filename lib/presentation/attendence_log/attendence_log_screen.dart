import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/attendence_log/component/card_absent_info.dart';
import 'package:fastteam_app/presentation/attendence_log/component/list_absent.dart';
import 'package:fastteam_app/presentation/attendence_log/component/month_picker.dart';
import 'package:fastteam_app/presentation/attendence_log/controller/attendence_log_controller.dart';
import 'package:fastteam_app/widgets/custom_refresh_widget.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AttendenceLogScreen extends StatefulWidget {
  const AttendenceLogScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceLogScreen> createState() => _AttendenceLogScreenState();
}

class _AttendenceLogScreenState extends State<AttendenceLogScreen> {
  DateTime _selectedDate = DateTime.now();
  AttendenceLogController controller = Get.put(AttendenceLogController());

  List<DateTime?> _dates = [];
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.loadDataForSelectedMonth(_selectedDate);
  }

  Future refreshItem() async {
    setState(() {});
  }

  Future<void> _selectMonth(BuildContext context) async {
    showMonthPicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year - 1, 1),
      lastDate: DateTime(DateTime.now().year + 1, 12),
    ).then((date) async {
      if (date != null) {
        setState(() {
          _selectedDate = date;
        });
        controller.loadDataForSelectedMonth(_selectedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMM().format(_selectedDate);
    int daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
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
                onTapArrowleft11();
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Attendence Log".tr),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  monthPicker(formattedDate, () => _selectMonth(context)),
                  cardAbsentInfo(context),
                  SizedBox(height: getVerticalSize(5)),
                  Expanded(
                    child: ListAbsent(daysInMonth),
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }

  Widget ListAbsent(int daysInMonth) {
    return RefreshWidget(
      onRefresh: refreshItem,
      child: ListView.separated(
        itemCount: daysInMonth,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10), // Jarak antara setiap item
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> item = controller.dataAbsent.isNotEmpty
              ? controller.dataAbsent[index]
              : {};
          String tanggal = (index + 1).toString();
          bool isSunday = item['isSunday'] ?? false;
          Color dateColor =
              item['dateColor'] ?? (isSunday ? Colors.red : Colors.black);
          String dateText = item['dateText'] ??
              (isSunday
                  ? '$tanggal ${DateFormat.MMM().format(_selectedDate)}\nHari Libur'
                  : '$tanggal ${DateFormat.MMM().format(_selectedDate)}');

          return AbsensiListItem(
            dateText: dateText,
            dateColor: dateColor,
            jamMasuk: item['jamMasuk'] ?? [],
            jamKeluar: item['jamKeluar'] ?? [],
            idMasuk: item['id_masuk'] ?? 0,
            idKeluar: item['id_keluar'] ?? 0,
            isSunday: isSunday,
          );
        },
      ),
    );
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.paymentMethodOneScreen,
    );
  }

  onTapArrowleft11() {
    Get.back();
  }
}
