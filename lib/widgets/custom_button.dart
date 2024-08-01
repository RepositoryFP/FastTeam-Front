import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT17:
        return getPadding(
          top: 17,
          right: 17,
          bottom: 17,
        );
      case ButtonPadding.PaddingT9:
        return getPadding(
          left: 9,
          top: 9,
          bottom: 9,
        );

      case ButtonPadding.PaddingT0:
        return getPadding(
         all: 0
        );
      case ButtonPadding.PaddingT12:
        return getPadding(
          top: 12,
          bottom: 12,
        );
      case ButtonPadding.PaddingAll7:
        return getPadding(
          all: 7,
        );
      case ButtonPadding.PaddingT47:
        return getPadding(
          top: 47,
          right: 47,
          bottom: 47,
        );
      case ButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      default:
        return getPadding(
          all: 15,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.White:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray:
        return ColorConstant.gray300;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillGray6001e:
        return ColorConstant.gray6001e;
      case ButtonVariant.FillLightgreen50:
        return ColorConstant.lightGreen50;
      case ButtonVariant.FillYellow50:
        return ColorConstant.yellow50;
      case ButtonVariant.FillRed50:
        return ColorConstant.red50;
      case ButtonVariant.Fillindigo50:
        return ColorConstant.indigo50;
      case ButtonVariant.OutlineIndigo800:
        return null;
      default:
        return ColorConstant.indigo800;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );

        case ButtonVariant.OutlineGray:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigo800:
        return BorderSide(
          color: ColorConstant.indigo800,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillIndigo800:
      case ButtonVariant.White:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGray6001e:
      case ButtonVariant.FillLightgreen50:
      case ButtonVariant.FillYellow50:
      case ButtonVariant.FillRed50:
        return null;
      case ButtonVariant.Fillindigo50:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.White:
        return ColorConstant.black9000f;
      case ButtonVariant.FillIndigo800:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.OutlineGray:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGray6001e:
      case ButtonVariant.FillLightgreen50:
      case ButtonVariant.FillYellow50:
      case ButtonVariant.FillRed50:
      case ButtonVariant.Fillindigo50:
      case ButtonVariant.OutlineIndigo800:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.RoundedBorder37:
        return BorderRadius.circular(
          getHorizontalSize(
            37.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.SFProTextSemibold17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProDisplayRegular17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Body:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.OutfitRegular16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.OutfitBold28:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            28,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProTextRegular17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.OutfitSemiBold18:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.OutfitRegular18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.OutfitSemiBold16:
        return TextStyle(
          color: ColorConstant.greenA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.OutfitSemiBold16Amber700:
        return TextStyle(
          color: ColorConstant.amber700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.OutfitSemiBold16RedA700:
        return TextStyle(
          color: ColorConstant.redA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.OutfitBold18Indigo800:
        return TextStyle(
          color: ColorConstant.indigo800,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProDisplayBold18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder16,
  RoundedBorder37,
  RoundedBorder8,
}
enum ButtonPadding {
  PaddingAll15,
  PaddingT17,
  PaddingT9,
  PaddingT0,
  PaddingT12,
  PaddingAll7,
  PaddingT47,
  PaddingAll11,
}
enum ButtonVariant {
  FillIndigo800,
  White,
  OutlineGray300,
  OutlineGray,
  FillWhiteA700,
  FillGray6001e,
  FillLightgreen50,
  FillYellow50,
  FillRed50,
  Fillindigo50,
  OutlineIndigo800,
}
enum ButtonFontStyle {
  OutfitBold18,
  SFProTextSemibold17,
  SFProDisplayRegular17,
  Body,
  OutfitRegular16,
  OutfitBold28,
  SFProTextRegular17,
  OutfitSemiBold18,
  OutfitRegular18,
  OutfitSemiBold16,
  OutfitSemiBold16Amber700,
  OutfitSemiBold16RedA700,
  OutfitBold18Indigo800,
  SFProDisplayBold18,
}
