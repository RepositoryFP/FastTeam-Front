import '../controller/book_a_wash_controller.dart';
import '../models/book_a_wash_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookAWashItemWidget extends StatelessWidget {
  BookAWashItemWidget(this.bookAWashItemModelObj);

  BookAWashItemModel bookAWashItemModelObj;

  var controller = Get.find<BookAWashController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            bookAWashItemModelObj.dateTxt.value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFProDisplayRegular20.copyWith(
              letterSpacing: getHorizontalSize(
                0.38,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.dateoneTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.datetwoTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.datethreeTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.datefourTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            bottom: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.datefiveTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Obx(
            () => Text(
              bookAWashItemModelObj.datesixTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProDisplayRegular20.copyWith(
                letterSpacing: getHorizontalSize(
                  0.38,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
