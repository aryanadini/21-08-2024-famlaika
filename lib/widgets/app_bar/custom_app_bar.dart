import 'package:famlaika1/constants/colors.dart';
import 'package:famlaika1/constants/sizeutils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Style{bgFill_1, bgOutline, bgFill}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions})
      :super(key: key,);

  final double? height;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,

    );
  }

  @override
  Size get preferredSize =>
      Size(
        SizeUtils.width,
        height ?? 56.v,
      );

  _getStyle() {
    switch (styleType) {
      case Style.bgOutline:
        return Container(
          height: 66.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray900,
          ),
        );
      case Style.bgOutline:
        return Container(
          height: 64.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: appTheme.gray90003,
              border: Border(
                  bottom: BorderSide(
                    color: appTheme.blueGray900,
                    width: 1.h,
                  )
              )

          ),

        );
      case Style.bgFill:
        return Container(
          height: 72.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: appTheme.gray90003
          ),
        );
      default:
        return null;
    }
  }
}
