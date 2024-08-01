import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/routes/app_routes.dart';
import 'package:fastteam_app/theme/app_decoration.dart';
import 'package:fastteam_app/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget contentIcon(status) => Column(
          children: [
            Container(
                width: getHorizontalSize(55),
                height: getVerticalSize(55),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorConstant.gray300),
                ),
                child: (status == "Attendance")
                    ? const Icon(
                        Icons.list_alt,
                        color: Colors.blue,
                        size: 30, // Ukuran ikon
                      )
                    : (status == "Module")
                        ? Icon(
                            Icons.folder,
                            color: Colors.yellow[600],
                            size: 30, // Ukuran ikon
                          )
                        : (status == "Payslip")
                            ? const Icon(
                                Icons.attach_money,
                                color: Colors.pink,
                                size: 30, // Ukuran ikon
                              )
                            : const Icon(
                                Icons.history,
                                color: Colors.amber,
                                size: 30, // Ukuran ikon
                              )),
            SizedBox(height: 5),
            Text(
              (status == "Attendance")
                  ? 'Attendance\nLog'
                  : (status == "Module")
                      ? 'Module'
                      : (status == "Payslip")
                          ? 'My Payslip'
                          : 'Milestone',
              style: AppStyle.txtSubheadline,
              textAlign: TextAlign.center,
            ),
          ],
        );
    Widget iconMenu(status) => InkWell(
        onTap: () => (status == "Attendance")
            ? Get.toNamed(
                AppRoutes.attendenceLog,
              )
            : (status == "Payslip")
                ? Get.toNamed(
                    AppRoutes.payslipValidation,
                  )
                : (status == "Milestone")
                    ? Get.toNamed(
                        AppRoutes.milestone,
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Menu masih belum tersedia",
                          style: AppStyle.txtRatingIndigo,
                        ),
                        backgroundColor: ColorConstant.red700,
                        behavior: SnackBarBehavior.floating,
                      )),
        child: contentIcon(status));
    Widget Menu() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconMenu("Attendance"),
            iconMenu("Module"),
            iconMenu("Payslip"),
            iconMenu("Milestone"),
          ],
        ),
      );
    }

    return Container(
        decoration: AppDecoration.white,
        child: Padding(
          padding: getPadding(bottom: 15),
          child: Menu(),
        ));
  }
}
