import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFloatingEditText extends StatelessWidget {
  CustomFloatingEditText(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.labelText,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  FloatingEditTextShape? shape;

  FloatingEditTextPadding? padding;

  FloatingEditTextVariant? variant;

  FloatingEditTextFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? labelText;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildFloatingEditTextWidget(),
          )
        : _buildFloatingEditTextWidget();
  }

  _buildFloatingEditTextWidget() {

    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        ),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,

      ),
    );
  }

  _buildDecoration() {

    return InputDecoration(
      labelText: labelText ?? "",
      labelStyle:
      TextStyle(
        color: ColorConstant.gray600,
        fontSize: getFontSize(
          17,
        ),
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: TextStyle(
        color: ColorConstant.black900,
        fontSize: getFontSize(
          17,
        ),
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
      hintText: hintText ?? "",
      hintStyle:  TextStyle(
        color:ColorConstant.gray600,
        fontSize: getFontSize(
          17,
        ),
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(variant: FloatingEditTextVariant.Outlineblue),
      errorBorder: _setBorderStyle(variant: FloatingEditTextVariant.errorRed),
      focusedErrorBorder:_setBorderStyle(variant: FloatingEditTextVariant.errorRed) ,
      errorStyle: TextStyle(
        color:ColorConstant.red,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints??BoxConstraints(
        maxHeight: getVerticalSize(54),
        minHeight: getVerticalSize(54)
      ),
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }


  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setBorderStyle({FloatingEditTextVariant? variant}) {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.red700,
            width: 1,
          ),
        );

        case FloatingEditTextVariant.Outlineblue:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo800,
            width: 1,
          ),
        );

        case FloatingEditTextVariant.errorRed:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.red,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return ColorConstant.gray50;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return true;
      case FloatingEditTextVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case FloatingEditTextPadding.PaddingT17:
        return getPadding(
          left: 14,
          top: 17,
          right: 14,
          bottom: 14,
        );
      default:
        return getPadding(
          left: 14,
          top: 14,
          right: 14,
          bottom: 17,
        );
    }
  }
}

enum FloatingEditTextShape {
  RoundedBorder16,
}
enum FloatingEditTextPadding {
  PaddingTB17,
  PaddingT17,
}
enum FloatingEditTextVariant {
  None,
  OutlineGray300,
  OutlineRed700,
  Outlineblue,
  errorRed,
}
enum FloatingEditTextFontStyle {
  OutfitRegular17,
}
