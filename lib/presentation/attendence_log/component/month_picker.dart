import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/theme/app_style.dart';
import 'package:flutter/material.dart';

Widget monthPicker(String date, VoidCallback onSelectMonth) {
  return Padding(
    padding: getPadding(left: 20, right: 20),
    child: TextButton(
      onPressed: onSelectMonth,
      style: TextButton.styleFrom(
        padding: getPadding(left: 5, right: 5),
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: Colors.black,
          width: getHorizontalSize(1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: getMargin(left: 5, right: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: getFontSize(24),
                  color: ColorConstant.indigo800,
                ),
                SizedBox(width: getHorizontalSize(5)),
                Text(
                  date,
                  style: AppStyle.txtHeadlineIndigo800,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: getFontSize(24),
          ),
        ],
      ),
    ),
  );
}
