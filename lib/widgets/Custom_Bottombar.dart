// import 'package:famlaika1/constants/ImageConstant.dart';
// import 'package:famlaika1/constants/colors.dart';
// import 'package:famlaika1/widgets/custom_image_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
//
// enum BottomBarEnum{chat,post}
// class Custombottombar extends StatefulWidget {
//    Custombottombar({this.onChanged});
//   Function(BottomBarEnum)? onChanged;
//
//   @override
//   State<Custombottombar> createState() => _CustombottombarState();
// }
//
// class _CustombottombarState extends State<Custombottombar> {
//   int selectedIndex=0;
//   List<BottomMenuModel>bottomMenuList=[
//     BottomMenuModel(
//       icon:ImageConstant.imgchat,
//       activeIcon:ImageConstant.imgchat,
//       title:"chat",
//       type:BottomBarEnum.chat,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgpost,
//       activeIcon:ImageConstant.imgpost,
//       title:"post",
//       type:BottomBarEnum.post,
//     )
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 73,
//       decoration: BoxDecoration(
//
//       ),
//       child: BottomNavigationBar(
//         backgroundColor: Colors.transparent,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedFontSize: 0,
//         elevation: 0,
//         currentIndex: selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         items: List.generate(bottomMenuList.length, (index) {
//           return BottomNavigationBarItem(icon: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomImageView(
//                 imagePath: bottomMenuList[index].icon,
//                 height: 18,
//                 width: 18,
//                 color: appTheme.gray900,
//
//               ),
//               Padding(padding: EdgeInsets.only(top: 2),
//                 child: Text(bottomMenuList[index].title??"",
//                 style: theme.textTheme.titleSmall!.copyWith(
//                   color: appTheme.black900,
//                 ),
//                 ),
//
//
//               )
//
//             ],
//           ),
//           activeIcon: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomImageView(
//                 imagePath: bottomMenuList[index].activeIcon,
//                 height: 18,
//                 width: 18,
//                 color: appTheme.gray900,
//
//               ),
//               Padding(padding: EdgeInsets.only(top: 2),
//               child: Text(bottomMenuList[index].title??"",
//               style: theme.textTheme.titleSmall!.copyWith(
//                 color: appTheme.black900,
//               ),
//               ),
//
//
//               )
//             ],
//           ),
//             label: '',
//           );
//         }
//         ),
//         onTap: (index){
//           selectedIndex=index;
//           widget.onChanged?.call(bottomMenuList[index].type);
//           setState(() {});
//         }
//       ),
//
//     );
//   }
// }
