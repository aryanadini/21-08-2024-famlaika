
import 'package:famlaika1/constants/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {

  CustomOutlinedButton({Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.backgroundColor,

    VoidCallback? onPressed,
    ButtonStyle?buttonStyle,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    Alignment? alignment,
    double?height,
    double? width,
    EdgeInsets? margin,
    required String text})
      : super(
      text: text,
      onPressed: onPressed,
      buttonStyle: buttonStyle,
      isDisabled: isDisabled,
      buttonTextStyle: buttonTextStyle,
      height: height,
      alignment: alignment,
      width: width,
      margin: margin
  );
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: buildOutlinedButtonWidget)
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget =>
      Container(
        height: (height ?? 40).h,
        width: (width ?? double.maxFinite).w,
        margin:margin != null ? EdgeInsets.all(margin!.left.w) : null,
        decoration: decoration,

        child: OutlinedButton(
          style:
          OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? Color(0xFF383838),

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(5.0.r), // Adjust the radius as needed
            ),
            side: BorderSide(

              color: Colors.white24, // Adjust the color as needed
              width: 0.5.w,
            ),

          ),
          onPressed: isDisabled ?? false ?
          null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //leftIcon ?? const SizedBox.shrink(),
              Text(text,
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,fontFamily: "Figtree",color: Color(0xFFFFFFFF))
                //buttonTextStyle?? theme.textTheme.bodyMedium,
              ),
              rightIcon ??  SizedBox.shrink()
            ],
          ),
        ),
      );
}