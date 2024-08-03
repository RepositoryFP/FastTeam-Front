import 'dart:io';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/image_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/routes/app_routes.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final String shift;
  final dynamic resp;
  final String aksi;
  final String kantor;

  const ResultScreen({
    super.key,
    required this.imageFile,
    required this.resp,
    required this.aksi,
    required this.kantor,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    final currentTime = DateFormat('h:mm a').format(DateTime.now());
    final currentDate = DateFormat('d MMM y').format(DateTime.now());
    final day = DateFormat('EEEE', 'en_US').format(DateTime.now());

    // Tetapkan warna dan gambar sesuai dengan status absensi
    Color timeColor;
    String imageAsset;
    print("test = ${resp['absensi']['status']}");
    if (resp['absensi']['status'] == 'late' ||
        resp['absensi']['status'] == 'to early') {
      timeColor = Colors.red;
      imageAsset = ImageConstant.imageTelat;
    } else {
      timeColor = Theme.of(context).primaryColor;
      imageAsset = ImageConstant.imageCentangSuccess;
    }

    // ignore: deprecated_member_use
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: getPadding(top: 100),
                            child: CustomImageView(
                                imagePath: ImageConstant.imageLogoPanjang,
                                height: getVerticalSize(66),
                                width: getHorizontalSize(300),
                                margin: getMargin(left: 8, top: 4, bottom: 4))),
                      ],
                    ),
                    SizedBox(height: getVerticalSize(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: getPadding(top: 5),
                            child: CustomImageView(
                                imagePath: imageAsset,
                                height: getVerticalSize(250),
                                width: getHorizontalSize(250),
                                margin: getMargin(left: 8, top: 4, bottom: 4))),
                      ],
                    ),
                    SizedBox(height: getVerticalSize(10)),
                    Text(
                      'Clock $aksi',
                      style: TextStyle(
                        fontSize: getFontSize(30),
                        fontWeight: FontWeight.w900,
                        color: timeColor,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                    SizedBox(height: getHorizontalSize(10)),
                    Text(
                      '$kantor - $day',
                      style: TextStyle(
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      shift,
                      style: TextStyle(
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      currentDate,
                      style: TextStyle(
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: getVerticalSize(10)),
                    Text(
                      currentTime,
                      style: TextStyle(
                        fontSize: getFontSize(20),
                        fontWeight: FontWeight.w500,
                        color: timeColor, // Ganti warna teks currentTime
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: getPadding(left: 10, right: 10, top: 80),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.homeContainerScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.indigo800,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Text(
                              'Back To Home',
                              style: AppStyle.txtBodyWhite,
                            ),
                          ),
                          SizedBox(height: getVerticalSize(15)),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.offAndToNamed(AppRoutes.attendenceLog);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Text(
                                'Show Log Attendance',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(16),
                      width: double.infinity,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
