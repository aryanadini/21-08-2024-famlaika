import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/addmember_view.dart';
import '../widgets/GradientButton.dart';

class DisplaySibling extends StatelessWidget {
  double cthgt;
  double ctwdt;
  double imagehgt;
  double imagewdt;
  double imagebradius;
  final String imageUrl;
 final String persongname;
 final String personrelation;
   String? relationType;
  bool isEditoraddmember;
  bool isDeleteMember;
  final VoidCallback? onPressed;

  DisplaySibling(
      {super.key,
        required this.imagehgt,
        required this.imagewdt,
        required this.imagebradius,
        required this.cthgt,
        required this.imageUrl,
       required this.persongname,
       required this.personrelation,
        required this.ctwdt,
         this.relationType,
      this.isEditoraddmember=true,
        this.isDeleteMember = true,
        this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ScreenUtil().setHeight(cthgt + imagehgt),
        width: ScreenUtil().setWidth(ctwdt + imagewdt),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
             // left: ScreenUtil().setWidth((ctwdt + imagewdt - ctwdt) / 2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xFF383838),
                ),
                height: ScreenUtil().setHeight(cthgt),
                width: ScreenUtil().setWidth(ctwdt),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      persongname,
                      style: TextStyle(fontSize: 16.sp, color: Color(0xFFFFFFFFFF),fontWeight: FontWeight.w400),
                    ),
                    Text(
                      personrelation ?? "Relation",
                      style: TextStyle(fontSize: 10.sp, color: Color(0xFFFFFFFFFF),fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(12),
              left: ScreenUtil().setWidth((ctwdt - imagewdt) / 2),
              child: Container(
                height:ScreenUtil().setHeight(imagehgt),
                width: ScreenUtil().setWidth(imagewdt),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ScreenUtil().setWidth(imagebradius)),
                    bottomRight: Radius.circular(ScreenUtil().setWidth(imagebradius)),
                    topLeft: Radius.circular(ScreenUtil().setWidth(imagebradius)),
                  ),
                  border: Border.all(
                    width:ScreenUtil().setWidth(1),

                    color: Color(0xFFF7B52C),
                  ),
                  image: DecorationImage(
                    image: AssetImage("${imageUrl}"),
                    // Use AssetImage for local assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isEditoraddmember)
              Positioned(
                bottom: ScreenUtil().setHeight(45),
                right: ScreenUtil().setWidth(85),
                child: Container(
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade300,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          // Only use relationType if it's the Editoraddmember page
                          bool defaultMale = relationType == "Father" || relationType == "Spouse";
                          bool isGenderFixed = true;
                          String relation = relationType ?? "Relation";

                          return Addmember(
                            defaultMale: defaultMale,
                            isGenderFixed: isGenderFixed,
                            relation: relation,
                          );
                        }));
                      },
                    ),
                  ),
                ),
              ),
            if (isDeleteMember)
              Positioned(
                bottom: ScreenUtil().setHeight(45),
                right: ScreenUtil().setWidth(85),
                child: Container(
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade200,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(CupertinoIcons.delete_simple, color: Colors.white, size: 20),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.delete_simple, color: Colors.white, size: 40),
                                  SizedBox(height: 10),
                                  Text(
                                    'Are you sure?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Do you really want to delete ${persongname ?? 'this.person'}(${personrelation ?? 'this relation'}) from the family tree?',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GradientButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                        isSolidColor: true,
                                        solidColor: Colors.grey,



                                      ),
                                      GradientButton(
                                        onPressed: () {

                                          // Confirm delete logic here
                                          Navigator.pop(context);
                                        },
                                        child: Text('Confirm'),








                                        )


                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        // Define your delete logic here
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DisplaySmallWidget extends StatelessWidget {
  double simagehgt;
  double simagewdt;
  double simagebradius;
  AssetImage? sinblingimage;
  String? stext;
  String siblingname;

  DisplaySmallWidget({
    super.key,
    required this.simagehgt,
    required this.simagewdt,
    required this.simagebradius,
    required this.siblingname,
    this.sinblingimage,
    this.stext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: simagehgt + (MediaQuery.of(context).size.width * 0.1),
      width: simagewdt,
      child: Stack(
        children: [
          Positioned(
              top: -1.h,
              left: ScreenUtil().setWidth(simagewdt) / 2,
              child: CContainer(
                cheight: ScreenUtil().setHeight(MediaQuery.of(context).size.width * 0.1),
                cwidth: 1,
              )),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height:ScreenUtil().setHeight(simagehgt),
              width:ScreenUtil().setWidth(simagewdt),
              decoration: BoxDecoration(
                  color: Colors.amber.shade700,
                  image: sinblingimage != null
                      ? DecorationImage(
                    image: sinblingimage!,
                    fit: BoxFit.cover,
                  )
                      : null,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ScreenUtil().setWidth(simagebradius)),
                    bottomRight: Radius.circular(ScreenUtil().setWidth(simagebradius)),
                    topLeft: Radius.circular(ScreenUtil().setWidth(simagebradius)),

                  ),
                  border: Border.all(
                    width: ScreenUtil().setWidth(1),
                    color: Color(0xFFF7B52C),
                  )),
              child: sinblingimage == null
                  ? Center(
                child: Text(
                  stext ?? "",
                  style: TextStyle(fontSize: 16.sp, color: Color(0xFF000000),fontWeight: FontWeight.w400),
                ),
              )
                  : null,
            ),
          ),


        ],
      ),
    );
  }
}

class CContainer extends StatelessWidget {
 final double cheight;
 final double cwidth;
  CContainer({super.key, required this.cheight, required this.cwidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7B52C),
      height: ScreenUtil().setHeight(cheight),
      width: ScreenUtil().setWidth(cwidth),
    );
  }
}