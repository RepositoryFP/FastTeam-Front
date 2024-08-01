import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
Widget cardAbsentInfo(BuildContext context) {
    return Container(
      margin: getMargin(left: 15,right: 15,top:15,bottom: 20),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getHorizontalSize(15)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.indigo800,
            borderRadius: BorderRadius.circular(getHorizontalSize(16)),
          ),
          padding: getPadding(all:16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildStatusItem('Absen', '1', 14),
                  _buildStatusItem('Late Clock In', '1', 14),
                  _buildStatusItem(
                      'Early Clock Out', '1', 14),
                ],
              ),
              SizedBox(height: getHorizontalSize(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildStatusItem('No Clock In', '1', 14),
                  _buildStatusItem('No Clock Out', '1', 14),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildStatusItem(String title, String count, double fontSize) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: getFontSize(fontSize),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Outfit',
          ),
        ),
        SizedBox(height: getHorizontalSize(8)),
        Text(
          count,
          style: TextStyle(
            fontSize: getFontSize(fontSize),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Outfit',
          ),
        ),
      ],
    );
  }