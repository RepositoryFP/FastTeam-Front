import 'package:fastteam_app/widgets/custom_button.dart';

import 'controller/filter_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/filter_model.dart';
import 'models/model_data.dart';

// ignore: must_be_immutable
class FilterBottomsheet extends StatefulWidget {
  FilterBottomsheet(this.controller);

  FilterController controller;

  @override
  State<FilterBottomsheet> createState() => _FilterBottomsheetState();
}

class _FilterBottomsheetState extends State<FilterBottomsheet> {
  List<FilterModel> catgory = ModelData.getCategory();
  List<RatingModel> rating = ModelData.getRating();
  FilterController filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 0,
            top: 15,
            right: 0,
            bottom: 15,
          ),
          decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL32,
          ),
          child: GetBuilder<FilterController>(
            init: FilterController(),
            builder:(filter) =>  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 179, right: 179),
                  child: Divider(
                    height: getVerticalSize(
                      5,
                    ),
                    thickness: getVerticalSize(
                      5,
                    ),
                    color: ColorConstant.gray8004c,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                Center(
                  child: Text("lbl_filter".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtSFProTextbold20),
                ),
                Divider(
                  color: ColorConstant.gray300,
                ),
                Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Text("lbl_categories".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtHeadline),
                ),
                GridView.builder(
                  primary: false,
                    shrinkWrap: true,
                  padding: getPadding(left: 16, right: 16,top: 16,bottom: 20),
                  itemCount: catgory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(48),
                      crossAxisCount: 2,
                      mainAxisSpacing: getHorizontalSize(16),
                      crossAxisSpacing: getHorizontalSize(24)),
                  itemBuilder: (context, index) {
                    FilterModel data = catgory[index];
                    return GestureDetector(
                      onTap: (){
                        filter.setCategory(index);
                      },
                      child: Container(
                        decoration:filter.currentCategory==index?AppDecoration.getFilterSheetCategoryButtonIndigo: AppDecoration.getFilterSheetCategoryButtonWhite,
                        child: Center(
                          child: Text(data.categoryName!,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: filter.currentCategory==index?AppStyle.txtBodyWhite:AppStyle.txtBody),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Text("lbl_rating".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtHeadline),
                ),
                GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding: getPadding(left: 16, right: 16,top: 16,bottom: 20),
                  itemCount: rating.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(32),
                      crossAxisCount: 4,
                      crossAxisSpacing: getHorizontalSize(20)),
                  itemBuilder: (context, index) {
                    RatingModel data = rating[index];
                    return GestureDetector(
                      onTap: (){
                        filter.setRating(index);
                      },
                      child: Container(
                        decoration:filter.currentRating==index?AppDecoration.getFilterSheetRatingButtonIndigo: AppDecoration.getFilterSheetRAtingButtonWhite,
                        child: Padding(
                          padding: getPadding(left: 16,right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgStarwhite,
                                color: filter.currentRating==index?ColorConstant.whiteA700:ColorConstant.indigo800,
                              ),
                              SizedBox(width: getHorizontalSize(4),),
                              Text(data.rate!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: filter.currentRating==index?AppStyle.txtRatingIndigo:AppStyle.txtRating),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: getPadding(left: 16,right: 16,top: 10,bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: (){Get.back();},
                          height: getSize(53),
                          text: "lbl_reset".tr,
                          fontStyle: ButtonFontStyle.OutfitBold18Indigo800,
                          variant: ButtonVariant.Fillindigo50,
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(24),),
                      Expanded(
                        child: CustomButton(
                          height: getSize(53),
                          text: "lbl_apply".tr,
onTap: (){Get.back();
                            Get.toNamed(AppRoutes.filterResultScreen);},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
