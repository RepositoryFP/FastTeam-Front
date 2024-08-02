// list_division_widget.dart

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/home_page/models/list_employee_absent_model.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

Widget listDivision(BuildContext context, RxList<EmployeeAbsent> memberData) {
  return Container(
    width: double.maxFinite,
    child: Container(
      padding: getPadding(all: 0),
      decoration: AppDecoration.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(left: 20, right: 20, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("List Member Division",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtHeadline),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.listDivision,
                    );
                  },
                  child: Padding(
                    padding: getPadding(bottom: 2),
                    child: Text("lbl_view_all".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtBody),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(left: 20, top: 10, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: getMargin(top: 10),
                  child: Row(
                    children: List.generate(
                      (memberData.length <= 3) ? memberData.length : 3,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Align(
                          child: CustomImageView(
                            url: memberData[index].image,
                            height: getVerticalSize(50),
                            width: getHorizontalSize(50),
                            radius:
                                BorderRadius.circular(getHorizontalSize(60)),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    )..addAll(
                        (memberData.length > 3)
                            ? [
                                Align(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: ColorConstant.gray300,
                                    child: CircleAvatar(
                                      radius: 23,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.8),
                                      child: Text(
                                        '+${memberData.length - 3}',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            : [],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
