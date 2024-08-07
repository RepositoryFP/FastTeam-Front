import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder:(controller) =>  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            child: Container(
              margin: getMargin(
                bottom: 5,
              ),
              padding: getPadding(
                left: 30,
                top: 29,
                right: 30,
                bottom: 29,
              ),
              decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Text(
                      "msg_are_you_sure_you2".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFProDisplaySemibold18,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: getVerticalSize(
                              46,
                            ),
                            text: "lbl_cancel".tr,
                            margin: getMargin(
                              right: 10,
                            ),
                            onTap: (){
                              Get.back();
                            },
                            variant: ButtonVariant.OutlineIndigo800,
                            shape: ButtonShape.RoundedBorder8,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle:
                            ButtonFontStyle.OutfitBold18Indigo800,
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            onTap: (){
                              PrefUtils.setIsSignIn(true);
                              PrefUtils.clearPreferencesData();
                              controller.getIndex(0);
                              Get.offAllNamed(AppRoutes.logInScreen);
                            },
                            height: getVerticalSize(
                              46,
                            ),
                            text: "lbl_log_out".tr,
                            margin: getMargin(
                              left: 10,
                            ),
                            shape: ButtonShape.RoundedBorder8,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle: ButtonFontStyle.SFProDisplayBold18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



