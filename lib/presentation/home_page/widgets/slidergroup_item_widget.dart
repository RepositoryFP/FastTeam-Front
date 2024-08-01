import '../../../widgets/custom_button.dart';
import '../controller/home_controller.dart';
import '../models/slidergroup_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlidergroupItemWidget extends StatelessWidget {
  SlidergroupItemWidget(this.slidergroupItemModelObj);

  SlidergroupItemModel slidergroupItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 5,right: 5),
      child: Container(

        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage( slidergroupItemModelObj.image!),fit: BoxFit.fill)),
        child: Padding(
          padding: getPadding(left: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${slidergroupItemModelObj.discount}% OFF",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtOutfitBold20,
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: Text(
                  slidergroupItemModelObj.title!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBody,
                ),
              ),
              CustomButton(
                onTap: (){
                  Get.toNamed(AppRoutes.serviceDetailScreen);
                },
                height: getVerticalSize(
                  36,
                ),
                width: getHorizontalSize(
                  109,
                ),
                text: "lbl_book_now".tr,
                margin: getMargin(
                  top: 9,
                ),
                padding: ButtonPadding.PaddingAll7,
                fontStyle: ButtonFontStyle.OutfitRegular16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
