import 'package:flutter/material.dart';
import 'package:fastteam_app/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillIndigo800 => BoxDecoration(
        color: ColorConstant.indigo800,
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineRed700 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.red700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineIndigo800 => BoxDecoration(
        color: ColorConstant.indigo5001,
        border: Border.all(
          color: ColorConstant.indigo800,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineIndigo8001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigo800,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray300,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get txtFillIndigo800 => BoxDecoration(
        color: ColorConstant.indigo800,
      );
  static BoxDecoration get fillIndigo50 => BoxDecoration(
        color: ColorConstant.indigo50,
      );
  static BoxDecoration get black => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get success => BoxDecoration(
        color: ColorConstant.greenA700,
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get white => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBlack90066 => BoxDecoration(
        color: ColorConstant.black90066,
      );
  static BoxDecoration get fillWhiteBorder24 => BoxDecoration(
        color: ColorConstant.whiteA700,
    borderRadius: BorderRadius.circular(getHorizontalSize(24))
      );
  static BoxDecoration get fillGray200ImgBg=> BoxDecoration(
        color: ColorConstant.gray5001,
    borderRadius: BorderRadius.circular(getHorizontalSize(16))
      );
  static BoxDecoration get fillIndigo5001 => BoxDecoration(
        color: ColorConstant.indigo5001,
      );
  static BoxDecoration get outlineGray9000f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray9000f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get txtWhite => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray300,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: ColorConstant.gray5001,
      );
  static BoxDecoration get getFilterSheetCategoryButtonWhite => BoxDecoration(
    color: ColorConstant.whiteA700,
    borderRadius: BorderRadiusDirectional.all(Radius.circular(getHorizontalSize(16))),
    border: Border.all(color: ColorConstant.indigo800)
  );
  static BoxDecoration get getFilterSheetCategoryButtonIndigo => BoxDecoration(
      color: ColorConstant.indigo800,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(getHorizontalSize(16))),
      border: Border.all(color: ColorConstant.indigo800)
  );

  static BoxDecoration get getFilterSheetRAtingButtonWhite => BoxDecoration(
      color: ColorConstant.whiteA700,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(getHorizontalSize(8))),
      border: Border.all(color: ColorConstant.indigo800)
  );
  static BoxDecoration get getFilterSheetRatingButtonIndigo => BoxDecoration(
      color: ColorConstant.indigo800,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(getHorizontalSize(8))),
      border: Border.all(color: ColorConstant.indigo800)
  );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderTL32 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
  );

  static BorderRadius circleBorder54 = BorderRadius.circular(
    getHorizontalSize(
      54,
    ),
  );

  static BorderRadius circleBorder70 = BorderRadius.circular(
    getHorizontalSize(
      70,
    ),
  );

  static BorderRadius txtCircleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder59 = BorderRadius.circular(
    getHorizontalSize(
      59,
    ),
  );

  static BorderRadius circleBorder28 = BorderRadius.circular(
    getHorizontalSize(
      28,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    