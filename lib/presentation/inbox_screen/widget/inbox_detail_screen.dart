import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/image_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/inbox_screen/controller/inbox_controller.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

void main() {
  // Load time zone data
  tzdata.initializeTimeZones();

  // Set the default time zone to Asia/Jakarta
  tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

  runApp(MaterialApp(
    home: InboxDetailScreen(notificationId: 0),
  ));
}

class InboxDetailScreen extends StatefulWidget {
  final int notificationId; // Add this line

  // Add a constructor that accepts the notificationData
  InboxDetailScreen({required this.notificationId});

  @override
  _InboxDetailScreenState createState() => _InboxDetailScreenState();
}

class _InboxDetailScreenState extends State<InboxDetailScreen> {
  int get notificationId => widget.notificationId;
  final InboxController controller = Get.put(InboxController());
  String title = '';
  String imageProf = '';
  String name = '';
  String message = '';
  String dateSend = '';

  @override
  void initState() {
    super.initState();
    controller.displayNotification(notificationId);
  }

  String dateFormat(String date) {
    String dateString = date;
    DateTime dateData =
        DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSZ").parseUtc(dateString);
    tz.TZDateTime jakartaTime =
        tz.TZDateTime.from(dateData, tz.getLocation('Asia/Jakarta'));
    String formattedDate = DateFormat('d MMM y HH:mm').format(jakartaTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
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
        body: Obx(() {
          var data = controller.notificationDetail[0];
          print(controller.notificationDetail[0].message);
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: getPadding(all:8),
                          child: CustomImageView(
                                url: data.sender!.photo,
                                height: getSize(80),
                                width: getSize(80),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(60)),
                                alignment: Alignment.center),
                          ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.sender!.name!,
                              style: AppStyle.txtOutfitBold22,
                            ),
                            Text(
                              data.title!,
                              style: AppStyle.txtSFProTextSemibold17,
                            ),
                            Text(
                              data.dateSend!,
                              style: AppStyle.txtFootnote,
                            ),
                          ]),
                    ]),
                Padding(padding: getPadding(all:8)),
                Divider(
                  height: getVerticalSize(2),
                  color: ColorConstant.indigo800,
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      data.message!,
                      style: AppStyle.txtSFProDisplayRegular20,
                    )),
              ]);
        }),
      ),
    );
  }

  onTapArrowleft11() {
    Get.back();
  }
}
