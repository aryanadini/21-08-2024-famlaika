import 'dart:math';

import 'package:famlaika1/constants/appbarConst.dart';
import 'package:famlaika1/pages/addmember_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/DisplaySibling.dart';

class Editoraddmember extends StatefulWidget {
  const Editoraddmember({super.key});

  @override
  State<Editoraddmember> createState() => _EditoraddmemberState();
}

class _EditoraddmemberState extends State<Editoraddmember> {
  List<String> siblingimages = [
    "assets/img/messi1.jpg",
    "assets/img/img.png",
    "assets/img/messi1.jpg",
    "assets/img/img.png",
    "assets/img/messi1.jpg",
    "assets/images/img_intersect_1.png"

  ];
  List<String> siblingnames = ["a", "b", "c", "d", "e","f"];
  String? siblingimg;
  String? siblingnme;
  bool selected = false;
  ScrollController _scrollController=ScrollController();
  bool isScrolledToEnd=false;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    siblingimg = siblingimages[0];
    siblingnme = siblingnames[0];
    _scrollController.addListener(_scrollListener );
  }
  void _scrollListener(){
    if (_scrollController.position.atEdge){
      bool isTop=_scrollController.position.pixels==0;
      if(!isTop){
        setState(() {
          isScrolledToEnd=true;
        });
      }
    }else{
      setState(() {
        isScrolledToEnd=false;
      });
    }
  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }


  @override
      Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width.r;
    var count = 4;
    var widthFactor = .5.r;
    void change() {
      print("calling");
      setState(() {
        count = siblingimages.length;
        widthFactor = 1.0.r;
      });
    }
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: CustomAppBar(title: "Edit or Add Member",
            actionWidget: TextButton(onPressed: (){

            }, child: Text("Skip",style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Figtree",
            ),)),
          ),


          body:


          SingleChildScrollView(
            child: Column(
            
              children: [
                SizedBox(height:12.h ,),
                Container(
            
                  //color: Colors.pinkAccent,
                  height: 65.h,
                  width: 330.w,
                  //color: Colors.pinkAccent,
                  child: Align(
                    alignment: Alignment.topLeft,
            
                    child: RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Select edit option for ‘Edit’ member and select ",
                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp,fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "‘Vacant space’ for adding family member.",
                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp,height: 1.36.h,fontWeight: FontWeight.w400),
                          ),
                        ]
                    )),
                    // Text(
                    //   "Entering your personal details and\nsetting up your profile",
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //     fontFamily: 'Figtree',
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 14.sp,
                    //     color: Color(0xFFFFFFFF),
                    //     height: 1.38.h,
                    //   ),
                    // ),
                  ),
                ),
                Container(
                    height:  1.sh,
                    //MediaQuery.of(context).size.height ,
                    width: 1.sw,
                    //MediaQuery.of(context).size.width ,
                    //670.r,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0.1.sh,
                            //MediaQuery.of(context).size.height * 0.1.h,
                            left: 0.53.sw-15.w,
                            //(MediaQuery.of(context).size.width * 0.5.w) - 15.w,
                            child: Icon(Icons.favorite,color: Color(0xFFF7B52C),size: 24.sp,)
            
            
                          // Image(image: AssetImage(
                          //     'assets/images/img_heart.png'),
                          //   height: 24, width: 24,
                          //   alignment: Alignment.topCenter,
                          //
                          // ),
                        ),
                        Positioned(
                            top:0.148.sh,
                            //MediaQuery.of(context).size.height * 0.15.h,
                            left: 0.54.sw-(0.01.sw),
                            //(MediaQuery.of(context).size.width * 0.5.w) - 1.w,
                            child: CContainer(
                              cwidth:0.002.sw,
                              cheight: 0.085.sh,
                              //MediaQuery.of(context).size.height * 0.095,
                            )
                        ), /// heart line
                        Positioned(
                            top: 0.245.sh,
                            //MediaQuery.of(context).size.height * 0.245,
                            left: 0.25.sw,
                            //(MediaQuery.of(context).size.width * 0.25),
                            child: CContainer(
                              cheight: 0.001.sh,
                              cwidth: selected == false ?  0.59.sw
                              //(MediaQuery.of(context).size.width * 0.54) :
                                  : isScrolledToEnd==false ?
                              0.8.sw
                                  : 0.468.sw,
                              // (MediaQuery.of(context).size.width * 0.8):(MediaQuery.of(context).size.width * 0.4)
            
            
                            )),
                        ///above sibling
                        Positioned(
                            top: 0.245.sh,
                            //MediaQuery.of(context).size.height * 0.245,
                            left: 0.25.sw,
                            //(MediaQuery.of(context).size.width * 0.25),
                            child: CContainer(
                              cheight: 0.51.sw,
                              //(MediaQuery.of(context).size.width * 0.51),
                              cwidth: 1,
                            )),
            
                        ///near sibling
                        selected==false?
                        Positioned(
                            top: 0.245.sh,
                            //MediaQuery.of(context).size.height * 0.245,
                            left: 0.42.sw,
                            //(MediaQuery.of(context).size.width * 0.4),
                            child: CContainer(
                              cheight: 0.3.sw,
                              //(MediaQuery.of(context).size.width * 0.3),
                              cwidth: 1,
                            )): Container(),
            
                        ///first sibilng line
            
                        Positioned(
                            top: 0.531.sh,
                            //MediaQuery.of(context).size.height * 0.531,
                            left: 0.54.sw-1,
                            //(MediaQuery.of(context).size.width * 0.5) - 1,
                            child: CContainer(
                              cwidth: 1,
                              cheight: 0.115.sh,
                              //MediaQuery.of(context).size.height * 0.115,
                            )
            
                        ),
            
                        ///child line
                        Positioned(
                            top: 0.53.sh,
                            //MediaQuery.of(context).size.height * 0.53,
                            left: 0.25.sw,
                            //(MediaQuery.of(context).size.width * 0.25),
                            child: CContainer(
                              cheight: 1,
                              cwidth: 0.5.sw,
                              //(MediaQuery.of(context).size.width * 0.5),
                            )),
                        /// me to spouse
                        selected == false ? Positioned(
                          top: 0.29.sh,
                          //MediaQuery.of(context).size.height * 0.29,
                          left: 0.4.sw-48.w,
                          //(MediaQuery.of(context).size.width * 0.4) - 48,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            imageUrl: siblingimages[0],
                            persongname: siblingnames[0],
                            personrelation: "Sibling",
                            isDeleteMember: false,
                          ),

                        )///first sibling

                            :Positioned(
                          top:0.29.sh,
                          //MediaQuery.of(context).size.height * 0.29,
                          left:0.42.sw - 55.w,
                          //(MediaQuery.of(context).size.width * 0.42) - 55,
                          child: Container(
                            color: Colors.transparent,
                            height: 10.h,
            
                            width: 10.w,
                            // child: DisplaySibling(
                            //   imagehgt: 80,
                            //   imagewdt: 80,
                            //   imagebradius: 40,
                            //   cthgt: 56,
                            //   ctwdt: 110,
                            //   imageUrl: siblingimages[0],
                            //   persongname: siblingnames[0],
                            //   personrelation: "Sibling",
                            // ),
                          ),
                        ),
                        // Positioned(
                        //   top: 0.37.sh - 10.h, // Adjust positioning to place the icon at the top right border
                        //   left: 0.39.sw - 55.w + 100.w, // Adjust positioning to place the icon at the right border
                        //   child: Container(
                        //     width: 30.w, // Adjust size as needed
                        //     height: 30.h, // Adjust size as needed
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.red.shade300, // Light red color
                        //     ),
                        //     child: Center(
                        //       child:IconButton(
                        //         icon:FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                        //         onPressed: () {  Navigator.push(context, MaterialPageRoute(builder:
                        //             (context)=> Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Sibling")));
                        //           // Add your edit/add member action here
                        //
                        //           // Handle the edit action here
                        //
                        //
                        //           // Handle the edit action here
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
            
                        Positioned(
                          top: 0.241.sh,
                          //MediaQuery.of(context).size.height * 0.245,
                          left: selected==false ?
                          0.589.sw - 22.5.w : 0.32.sw - 10.5.w,
                          //((MediaQuery.of(context).size.width * 0.55) - 22.5):((MediaQuery.of(context).size.width*0.32)-22.5),
            
                          child: selected == false
                              ? Padding(
                            padding: EdgeInsets.only(
                              left: 0.063.sw,
                              // MediaQuery.of(context).size.width * 0.063
                            ),
                            child: Container(
                              height: 80.h,
                              width: 480.w,
            
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: count >= 4 ?5 : siblingimages
                                    .length + 1,
                                itemBuilder: (context, index) =>
                                !(index == count)
                                    ? InkWell(
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    change();
                                    setState(() {
                                      siblingimg = siblingimages[index];
                                      siblingnme = siblingnames[index];
                                    });
                                  },
                                  child: Align(
                                    widthFactor: widthFactor,
                                    child: DisplaySmallWidget(
                                      siblingname: siblingnames[index],
                                      sinblingimage:
                                      AssetImage("${siblingimages[index]}"),
                                      simagehgt: 40.h,
                                      simagewdt: 40.w,
                                      simagebradius: 20.r,

                                    ),
                                  ),
                                )
                                    : InkWell(
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    change();
                                    setState(() {
                                      selected = true;
                                      siblingimg = siblingimages[index];
                                      siblingnme = siblingnames[index];
                                    });
                                  },
                                  child: Align(
                                    widthFactor: widthFactor,
                                    child: DisplaySmallWidget(
                                      simagehgt: 40.h,
                                      simagewdt: 40.w,
                                      simagebradius: 40.r,
                                      stext: "2 +",
                                      siblingname: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
            
                          )
                          //   : Padding(
                          // padding: const EdgeInsets.only(left: 20.0),
                              : Container(
                            height: 0.226.sh,
                            //MediaQuery.of(context).size.height * 0.226,
            
                            width: 0.3.sh,
                            //MediaQuery.of(context).size.height * 0.3,/// show all frames
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  selected =false;
                                });
                              },
                              child: ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: siblingimages.length,
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 2.0,right:30),
                                    child: Container(
                                      height:0.1.sh + 80.h,

                                      //MediaQuery.of(context).size.height * 0.1 + 80,
                                      width: 110.w,
                                      child: Stack(children: [
                                        Positioned(
                                          top: 4.h,
                                          left: 65.w,
                                          //110 / 2,
                                          child: CContainer(
                                            cwidth: 1,
                                            cheight:0.1.sh+ 80.h,
                                            //MediaQuery.of(context).size.height * 0.1,
                                          ),
                                        ), /// above siblings line vertical
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: DisplaySibling(
                                            imagehgt: 50.h,
                                            imagewdt: 58.w,
                                            imagebradius: 40.r,
                                            cthgt: 46.h,
                                            ctwdt: 120.w,
                                            imageUrl: siblingimages[index],
                                            persongname: siblingnames[index],
                                            personrelation: "Sibling",
                                            isDeleteMember: false,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // ),
            
                        Positioned(
                          top: 0.04.sh,
                          //MediaQuery.of(context).size.height * 0.04,
                          left: 0.25.sw -55.w,
                          //(MediaQuery.of(context).size.width * 0.25) - 55,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            isDeleteMember: false,
                            imageUrl: 'assets/images/img_father.png',
                            persongname: '', personrelation: '',
                          ),
                        ),
                       // father
                        Positioned(
                          top: 0.04.sh,
                          //MediaQuery.of(context).size.height * 0.04,
                          left: 0.75.sw - 55.w,
                          //(MediaQuery.of(context).size.width * 0.75) - 55,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            isDeleteMember: false, imageUrl: 'assets/images/img_mother.png',
                            persongname: '',
                            personrelation: "",
                          ),
                        ),
                        // mother
                        // Positioned(
                        //   top: 0.11.sh - 10.h, // Adjust positioning to place the icon at the top right border
                        //   left: 0.72.sw - 55.w + 100.w, // Adjust positioning to place the icon at the right border
                        //   child: Container(
                        //     width: 30.w, // Adjust size as needed
                        //     height: 30.h, // Adjust size as needed
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.red.shade300, // Light red color
                        //     ),
                        //     child: Center(
                        //       child: IconButton(
                        //         icon:FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                        //         onPressed: () {  Navigator.push(context, MaterialPageRoute(builder:
                        //             (context)=> Addmember(defaultMale: false, isGenderFixed: true,relation: "Mother")));
                        //           // Add your edit/add member action here
                        //
                        //           // Handle the edit action here
                        //
                        //
                        //           // Handle the edit action here
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: 0.47.sh,
                          //MediaQuery.of(context).size.height * 0.47,
                          left:0.24.sw - 55.w,
                          //(MediaQuery.of(context).size.width * 0.25) - 55,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            isEditoraddmember: false,
                            isDeleteMember: false, imageUrl: 'assets/images/img_me.png',
                            persongname: '', personrelation: '',
                          ),
                        ), // me
                        Positioned(
                          top: 0.47.sh,
                          //MediaQuery.of(context).size.height * 0.47,
                          left: 0.75.sw - 55.w,
                          //(MediaQuery.of(context).size.width * 0.75) - 55,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            isDeleteMember: false, imageUrl: 'assets/images/img_spouse.png',
                            persongname: '', personrelation: '',
                          ),
                        ), //spouse
                        // Positioned(
                        //   top: 0.54.sh - 10.h, // Adjust positioning to place the icon at the top right border
                        //   left: 0.72.sw - 55.w + 100.w, // Adjust positioning to place the icon at the right border
                        //   child: Container(
                        //     width: 30.w, // Adjust size as needed
                        //     height: 30.h, // Adjust size as needed
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.red.shade300, // Light red color
                        //     ),
                        //     child: Center(
                        //       child:IconButton(
                        //         icon:FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                        //         onPressed: () {  Navigator.push(context, MaterialPageRoute(builder:
                        //             (context)=> Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Spouse")));
                        //           // Add your edit/add member action here
                        //
                        //           // Handle the edit action here
                        //
                        //
                        //           // Handle the edit action here
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: 0.63.sh,
                          //MediaQuery.of(context).size.height * 0.63,
                          left: 0.5.sw- 55.w,
                          //(MediaQuery.of(context).size.width * 0.5) - 55,
                          child: DisplaySibling(
                            imagehgt: 50.h,
                            imagewdt: 58.w,
                            imagebradius: 40.r,
                            cthgt: 46.h,
                            ctwdt: 120.w,
                            isDeleteMember: false, imageUrl: 'assets/images/img_child.png',
                            persongname: '', personrelation: '',
                          ),
                        ),
                        // child
                        // Positioned(
                        //   top: 0.7.sh - 10.h, // Adjust positioning to place the icon at the top right border
                        //   left: 0.47.sw - 55.w + 100.w, // Adjust positioning to place the icon at the right border
                        //   child: Container(
                        //     width: 30.w, // Adjust size as needed
                        //     height: 30.h, // Adjust size as needed
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: Colors.red.shade300, // Light red color
                        //     ),
                        //     child: Center(
                        //       child:IconButton(
                        //         icon:FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                        //         onPressed: () { Navigator.push(context, MaterialPageRoute(builder:
                        //             (context)=> Addmember(defaultMale: Random().nextBool(), isGenderFixed: false,relation: "Child")));
                        //         // Add your edit/add member action here
                        //
                        //           // Handle the edit action here
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )),
              ],
            ),
          ),
        );
    }
  }
