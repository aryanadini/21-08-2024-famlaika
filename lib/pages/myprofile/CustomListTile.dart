import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatefulWidget {
  final Icon leadingIcon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        height: 45.h,

        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(40.0),
          ),
          boxShadow: _isTapped
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ]
              : null,
        ),
        child: ListTile(
          leading: widget.leadingIcon,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
