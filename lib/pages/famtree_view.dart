import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:famlaika1/constants/ImageConstant.dart';
import 'package:famlaika1/constants/appDecoration.dart';
import 'package:famlaika1/constants/appbarConst.dart';
import 'package:famlaika1/pages/addmember_view.dart';
import 'package:famlaika1/widgets/custom_icon_button.dart';
import 'package:famlaika1/widgets/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import '../constants/DisplaySibling.dart';
import '../constants/colors.dart';
import '../widgets/custom_OutlinedButton.dart';

class Famtree extends StatefulWidget {
  final String? mePhotoPath;
   Famtree({super.key, this.mePhotoPath});

  @override
  State<Famtree> createState() => _FamtreeState();
}

class _FamtreeState extends State<Famtree> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: CustomAppBar(title: "Create Family tree",
          actionWidget: TextButton(onPressed: (){

          }, child: Text("Skip",style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "Figtree",
          ),)),

        ),

        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
          
                  width: 290.w,
          
                  //margin: EdgeInsets.only(right: 51.w),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Keep your family connected by adding them ',
                        style: TextStyle(fontSize: 14.sp,fontFamily: "Figtree", color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text:'to your profile.',style: TextStyle(fontFamily: "Figtree",
                      fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xFFFFFFFF),height: 1.36.h
                      ))
                    ]
                  ))
                  // Text(
                  //   "Keep your family connected by adding them \nto your profile.",
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: theme.textTheme.bodyMedium!.copyWith(height: 1.57.h),
                  // ),
                ),

                SizedBox(height: 33.h),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 502.h,
                    width: 345.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: (MediaQuery.of(context).size.width * 0.44) - 15.w,
                          child:Icon(Icons.favorite,color: Color(0xFFF7B52C),
                          size: 24.h,
                          )
                          // Image(
                          //   image: AssetImage('assets/images/img_heart.png'),
                          //   height: 24.h,
                          //   width: 24.w,
                          //   alignment: Alignment.topCenter,
                          // ),
                        ),
                        Positioned(
                          height: 200.h,
                          width: 215.w,
                          top: 65.h,
                          left: 50.w,
                          // top: MediaQuery.of(context).size.height * 0.08,
                          //   left: (MediaQuery.of(context).size.width * 0.01) - 1.w,
          
                            child: Image.asset("assets/images/img_union.png")),
                        Positioned(
                            height: 320.h,
                            width: 130.w,
                            top: 170.h,
                            left: 98.w,
                            child: Image.asset("assets/images/img_Tunion.png",)),
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.08,
                        //   left: (MediaQuery.of(context).size.width * 0.45) - 1.w,
                        //   child: CContainer(
                        //     cwidth: 2.w,
                        //     cheight: MediaQuery.of(context).size.height * 0.095,
                        //   ),
                        // ), ///heart to sblings
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.175,
                        //   left: (MediaQuery.of(context).size.width * 0.13),
                        //   child: CContainer(
                        //     cheight: 1.h,
                        //     cwidth: selected == false
                        //         ? (MediaQuery.of(context).size.width * 0.65)
                        //         : (MediaQuery.of(context).size.width * 0.509),
                        //   ),
                        // ),/// horizontal sibling
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.175,
                        //   left: (MediaQuery.of(context).size.width * 0.78) - 1.w,
                        //   child: CContainer(
                        //     cwidth: 1.w,
                        //     cheight: MediaQuery.of(context).size.height * 0.1,
                        //   ),
                        // ),///vertical sibilings
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.175,
                        //   left: (MediaQuery.of(context).size.width * 0.13),
                        //   child: CContainer(
                        //     cheight: (MediaQuery.of(context).size.width * 0.57),
                        //     cwidth: 1.w,
                        //   ),
                        // ),/// near sibling me
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.48,
                        //   left: (MediaQuery.of(context).size.width * 0.45) - 1.w,
                        //   child: CContainer(
                        //     cwidth: 1.w,
                        //     cheight: MediaQuery.of(context).size.height * 0.12,
                        //   ),
                        // ),///child vertical
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height * 0.48,
                        //   left: (MediaQuery.of(context).size.width * 0.23),
                        //   child: CContainer(
                        //     cheight: 1.h,
                        //     cwidth: (MediaQuery.of(context).size.width * 0.5),
                        //   ),
                        // ),///me to spouse
                        _buildMotherButton(context),
                        _buildChildButton(context),
                        _buildMeButton(context),
                        _buildSpouseButton(context),
                        _buildSiblingsButton(context),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: 107.h,
                            width: 130.w,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                _buildFatherButton(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMotherButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 52.h,
          right: 23.w,

          child: CustomOutlinedButton(
            width: 110.w,
            text: "+ Mother",

            margin: EdgeInsets.only(top: 59.h),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 0),
              // child: Image(
              //   image: AssetImage("assets/images/img_plus.png"),
              //   height: 16.h,
              //   width: 16.w,
              // ),
            ),
            alignment: Alignment.topRight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: false, isGenderFixed: true,relation: "Mother"),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 45.w,top: 2.h),
          child: CustomIconButton(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: false, isGenderFixed: true,relation: "Mother"),
                ),
              );

            },

            height: 50.h,
            width: 58.w,
            padding: EdgeInsets.all(15.w),
            alignment: Alignment.topRight,
            avatarImagePath: "assets/images/img_16.png",
            avatarSize: 30.w,
            child: CustomImageView(
              imagePath: ImageConstant.imgframe,
            ),
          ),
        ),
        // Positioned(
        //   top: 15.h,
        //   right: 58.w,
        //   child: CircleAvatar(
        //     radius: 15.w,
        //     backgroundColor: Color(0xFF949292),
        //     backgroundImage: AssetImage("assets/images/img_1.png"),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildSiblingsButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 271.h,
          right: 20.w,
          child: CustomOutlinedButton(
            width: 110.w,
            text: "+ Siblings",
            margin: EdgeInsets.only(bottom: 12.h),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 0),
              // child: Image(
              //   image: AssetImage("assets/images/img_plus.png"),
              //   height: 16.h,
              //   width: 16.w,
              // ),
            ),
            alignment: Alignment.centerRight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Sibling"),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 142.h,
            right: 40.w,
          ),
          child: CustomIconButton(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Sibling"),
              ),
              );
            },
            height: 50.h,
            width: 58.w,
            padding: EdgeInsets.all(15.w),
            alignment: Alignment.topRight,
            avatarImagePath: "assets/images/img_16.png",
            avatarSize: 30.w,
            child: CustomImageView(
              imagePath: ImageConstant.imgframe,
            ),
          ),
        ),
        // Positioned(
        //   top: 152.h,
        //   right: 53.w,
        //   child: CircleAvatar(
        //     radius: 15.w,
        //     backgroundColor: Color(0xFF949292),
        //     backgroundImage: AssetImage("assets/images/img_1.png"),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildChildButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 50.h,
          right: 110.w,
          child: CustomOutlinedButton(

            width: 110.w,
            text: "+ Child",
            leftIcon: Container(
              margin: EdgeInsets.only(right: 0),
              // child: Image(
              //   image: AssetImage("assets/images/img_plus.png"),
              //   height: 16.h,
              //   width: 16.w,
              // ),
            ),
            alignment: Alignment.bottomCenter,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Child"),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 84.h,
          left: 3.w),
          child: CustomIconButton(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Child"),
                ),
                );
                },
            height: 50.h,
            width: 58.w,

            padding: EdgeInsets.all(15.w),
            alignment: Alignment.bottomCenter,
            avatarImagePath: "assets/images/img_16.png",
            avatarSize: 30.w,
            child: CustomImageView(
              imagePath: ImageConstant.imgframe,
            ),
          ),
        ),
        // Positioned(
        //   top: 375.h,
        //   left: 155.w,
        //   child: CircleAvatar(
        //     radius: 15.w,
        //     backgroundColor: Color(0xFF949292),
        //     backgroundImage: AssetImage("assets/images/img_1.png"),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildMeButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 150.h,
          left: 15.w,
          child: CustomOutlinedButton(
            width: 110.w,

            buttonTextStyle: theme.textTheme.bodyLarge!,
            text: "Me",
            margin: EdgeInsets.only(bottom: 107.h),
            alignment: Alignment.bottomLeft,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 58.h,
            width: 58.w,
            margin: EdgeInsets.only(
              left: 40.w,
              bottom: 182.h,
            ),
            decoration: AppDecoration.outlineYellow.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL34,
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(29.w),
            //   child:widget. mePhotoPath !=null ?
            //   Image.file(
            //     File(widget.mePhotoPath!),
            //     fit:BoxFit.cover,
            //     errorBuilder: (context, error, stackTrace) {
            //       return Icon(Icons.error, size: 58.w, color: Colors.red);
            //     },
            //   )
            //       : Icon(Icons.person, size: 58.w, color: Colors.grey),
            //
            //
            // ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpouseButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 150.h,
          right: 21.w,
          child: CustomOutlinedButton(
            width: 110.w,
            text: "+ Spouse",

            leftIcon: Container(
              margin: EdgeInsets.only(right: 0),
              // child: Image(
              //   image: AssetImage("assets/images/img_plus.png"),
              //   height: 16.h,
              //   width: 16.w,
              // ),
            ),
            alignment: Alignment.centerRight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Spouse",),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 44.w,
            bottom: 182.h,
          ),
          child: CustomIconButton(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Spouse",),
                ),
                );
                },
            height: 50.h,
            width: 58.w,

            padding: EdgeInsets.all(15.w),
            alignment: Alignment.bottomRight,
            avatarImagePath: "assets/images/img_16.png",
            avatarSize: 30.w,
            child: CustomImageView(
              imagePath: ImageConstant.imgframe,
            ),
          ),
        ),
        // Positioned(
        //   top: 277.h,
        //   right: 53.w,
        //   child: CircleAvatar(
        //     radius: 15.w,
        //     backgroundColor: Color(0xFF949292),
        //     backgroundImage: AssetImage("assets/images/img_1.png"),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildFatherButton(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50.h,
          left: 10.w,
          child: CustomOutlinedButton(
            width: 110.w,
            text: "+ Father",
            margin: EdgeInsets.only(top: 59.h),
            leftIcon: Container(

              margin: EdgeInsets.only(left:0.w),
              // child: Image(
              //   image: AssetImage("assets/images/img_plus.png"),
              //   height: 16.h,
              //   width: 16.w,
              // ),
            ),
            alignment: Alignment.bottomCenter,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmember(defaultMale: true, isGenderFixed: true,relation: "Father",),
                ),
              );
            },
          ),
        ),
        Padding(padding: EdgeInsets.only(
            left: 40.w,bottom: 185.h)),
        CustomIconButton(
                    onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Addmember(defaultMale: true, isGenderFixed: true,relation: "Father",),
              ),
              );
              },
          height: 50.h,
          width: 58.w,
          padding: EdgeInsets.all(15.w),
          alignment: Alignment.topCenter,
          avatarImagePath: "assets/images/img_16.png",
          avatarSize: 30.w,
          child: CustomImageView(
            imagePath: ImageConstant.imgframe,
          ),
        ),
        // Positioned(
        //   top: 15.h,
        //   right: 75.w,
        //   child: CircleAvatar(
        //     radius: 15.w,
        //     backgroundColor: Color(0xFF949292),
        //     backgroundImage: AssetImage("assets/images/img_1.png"),
        //   ),
        // ),
      ],
    );
  }
}