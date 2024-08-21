import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/chat_view.dart';
import '../pages/homefamilytree/home2.dart';
import '../pages/post_view_bottom/post_view.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;
  List<Widget> bottomlist = [
    Home2(),
    Chat(),
    postfeed(postedText: '',),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: bottomlist[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: "Home",
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Figtree",
              color: Color(0xFF000000),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.chat_bubble_text),
            label: "Chat",
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Figtree",
              color: Color(0xFF000000),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.bookmark_border_rounded),
            label: "Post",
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Figtree",
              color: Color(0xFF000000),
            ),
          ),
        ],
        color: Colors.orangeAccent,
        buttonBackgroundColor: Colors.orangeAccent,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   CustomBottomNavigationBar({
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.h, // Adjust height as needed
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFFFFA726), Color(0xFFFFC107)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.r),
//           topRight: Radius.circular(20.r),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(
//             icon: Icons.home,
//             label: "Home",
//             index: 0,
//             selected: currentIndex == 0,
//           ),
//           _buildNavItem(
//             icon: Icons.chat,
//             label: "Chat",
//             index: 1,
//             selected: currentIndex == 1,
//           ),
//           _buildNavItem(
//             icon: Icons.bookmark,
//             label: "Post",
//             index: 2,
//             selected: currentIndex == 2,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem({
//     required IconData icon,
//     required String label,
//     required int index,
//     required bool selected,
//   }) {
//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 50.r,
//             height: 50.r,
//             decoration: BoxDecoration(
//               color: selected ? Colors.black : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               color: selected ? Colors.orangeAccent : Colors.black,
//               size: 24.r,
//             ),
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14.sp,
//               fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
