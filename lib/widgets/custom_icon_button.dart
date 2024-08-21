import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
    this.avatarImagePath,
    this.avatarSize = 24.0, // Default avatar size
  }) : super(key: key);

  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Widget? child;
  final VoidCallback? onTap;
  final String? avatarImagePath;
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment!,
      child: iconButtonWidget,
    )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: (height ?? 0).h,
    width: (width ?? 0).w,
    child: Stack(
      fit: StackFit.expand,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          icon: Container(
            height: (height ?? 0).h,
            width: (width ?? 0).w,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: Color(0xFF383838),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.h),
                    bottomLeft: Radius.circular(34.h),
                    bottomRight: Radius.circular(34.h),
                  ),
                  border: Border.all(
                    color: Colors.white24,
                    width: 1.h,
                  ),
                ),
          ),
        ),
        if (avatarImagePath != null) ...[
          Center(
            // top: ((height ?? 0) / 2) - (avatarSize / 2),
            // left: ((width ?? 0) / 2) - (avatarSize / 2),
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(avatarImagePath!),
                  fit: BoxFit.cover,
                ),
                color: Color(0xFF949292),
              ),
            ),
          ),
        ],
        if (child != null) Center(child: child),
      ],
    ),
  );
}
