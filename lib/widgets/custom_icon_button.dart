import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case IconButtonPadding.PaddingAll17:
        return getPadding(
          all: 17,
        );
      case IconButtonPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      default:
        return getPadding(
          all: 10,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillIndigo50:
        return ColorConstant.indigo50;
      case IconButtonVariant.White:
        return ColorConstant.whiteA700;
      case IconButtonVariant.OutlineGray70019:
        return ColorConstant.indigo800;
      case IconButtonVariant.OutlineGray9000f:
        return ColorConstant.indigo800;
      case IconButtonVariant.FillIndigo5001:
        return ColorConstant.indigo5001;
      default:
        return ColorConstant.indigo800;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineGray70019:
        return [
          BoxShadow(
            color: ColorConstant.gray70019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              5,
            ),
          ),
        ];
      case IconButtonVariant.OutlineGray9000f:
        return [
          BoxShadow(
            color: ColorConstant.gray9000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case IconButtonVariant.FillIndigo800:
      case IconButtonVariant.FillIndigo50:
      case IconButtonVariant.White:
      case IconButtonVariant.FillIndigo5001:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  CircleBorder20,
  CircleBorder14,
}
enum IconButtonPadding {
  PaddingAll10,
  PaddingAll6,
  PaddingAll17,
  PaddingAll3,
}
enum IconButtonVariant {
  FillIndigo800,
  FillIndigo50,
  White,
  OutlineGray70019,
  OutlineGray9000f,
  FillIndigo5001,
}
