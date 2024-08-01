import 'package:flutter/services.dart';

import 'controller/onboarding_1_controller.dart';
import 'models/onboarding_1_model.dart';
import 'models/sliderdriveyour_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
  List<Onboarding1Model> onbording =
  SliderdriveyourItemModel.getOnboardingData();
  PageController pageController = PageController();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        closeApp();
        return false;
      },
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: GetBuilder<Onboarding1Controller>(
            init: Onboarding1Controller(),
            builder: (controller) => Stack(
              children: [
                PageView.builder(
                  onPageChanged: (value) {
                    controller.setCurrentPage(value);
                  },
                  controller: pageController,
                  itemCount: onbording.length,
                  itemBuilder: (context, index) {
                    Onboarding1Model data = onbording[index];
                    return Column(
                      children: [
                        CustomImageView(
                          imagePath: data.image,
                          height: getSize(558),
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: getVerticalSize(34),
                        ),
                        Container(
                          width: getHorizontalSize(
                            257,
                          ),
                          child: Text(
                            data.title!,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtOutfitBold28,
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            290,
                          ),
                          margin: getMargin(
                            top: 18,
                          ),
                          child: Text(
                            data.subtitle!,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtBody,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: getPadding(bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(onbording.length, (index) {
                            return AnimatedContainer(
                              margin: getMargin(left: 4, right: 4),
                              duration: const Duration(milliseconds: 300),
                              height: getSize(8),
                              width: getSize(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (index == controller.currentPage)
                                      ? ColorConstant.indigo800
                                      : ColorConstant.gray300),
                            );
                          })),
                      CustomButton(
                          height: getVerticalSize(54),
                          text: controller.currentPage == onbording.length - 1
                              ? "Get started"
                              : "lbl_next".tr,
                          margin: getMargin(left: 16, top: 32, right: 16),
                          onTap: controller.currentPage == onbording.length - 1
                              ?(){ PrefUtils.setIsIntro(false);
                          Get.toNamed(
                            AppRoutes.logInScreen,
                          );}
                              : () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          }),
                      GestureDetector(
                          onTap: () {PrefUtils.setIsIntro(false);

                          onTapTxtSkip();
                          },
                          child: Padding(
                              padding: getPadding(top: 21, bottom: 10),
                              child: Text(controller.currentPage ==
                                  onbording.length - 1?"":"lbl_skip".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtHeadline)))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  onTapNext() {
    PrefUtils.setIsIntro(true);
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }

  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}




