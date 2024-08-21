
import 'dart:io';
import 'package:famlaika1/constants/appbarConst.dart';
import 'package:famlaika1/constants/bottom.dart';
import 'package:famlaika1/pages/homefamilytree/home2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/colors.dart';
import '../widgets/GradientButton.dart';

class Addmember extends StatefulWidget {
  final String relation;
  final bool defaultMale;
  final bool isGenderFixed;
  const Addmember({super.key,required this.relation, required this.defaultMale, this.isGenderFixed = false});

  @override
  State<Addmember> createState() => _AddmemberState();
}

class _AddmemberState extends State<Addmember> {
  File? _image;


  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }





 late bool female ;
  late Color mcolor;
  Color fcolor = Colors.grey;

  TextEditingController dateinput = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String name = "";
  final TextEditingController _PhoneNumberController = TextEditingController();
  TextEditingController _FullNameController = TextEditingController();
  TextEditingController _RelationController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    female=!widget.defaultMale;
    dateinput.text = "";// set the initial value of text field
    _RelationController.text = widget.relation;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      appBar: CustomAppBar(title: 'Add Member',
        actionWidget: TextButton(onPressed: (){

        }, child: Text("Skip",style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Figtree",
        ),)),
      ),

      body: SingleChildScrollView(

        child: Form(
          key: formKey,
          child: Column(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width * double.maxFinite,

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
                            text: "Let's start by adding a new family member to ",
                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp,fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "your family tree.",
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
                Stack(
                  children: [

                    GestureDetector(
                      onTap: _pickImageFromGallery,

                      child: Container(
                        width: 130.r,
                        height: 130.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _image != null ? Color(0xFFF7B52C) : Color(0xFF2B2B2B),
                              width: 2.0,
                            )
                        ),
                        child: CircleAvatar(
                          radius: 65.r, // CircleAvatar radius
                          backgroundColor: Color(0xFF2B2B2B),
                          backgroundImage: _image !=null ? FileImage(_image!): null,

                          child:_image==null
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/uploagimgperson.png",width: 42.w,),
                              // Icon(
                              //   Icons.person,
                              //   size: 55.sp, // Icon size
                              //   color: Color(0xFF737272),
                              // ),
                              TextButton(
                                onPressed: _pickImageFromGallery,
                                child: Text(
                                  "Upload Photo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12.sp, // Text size
                                  ),
                                ),
                              ),
                            ],
                          )
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90.h, // Position below the CircleAvatar
                      right: 12.w, // Align to the right of CircleAvatar
                      child: Container(

                        height: 30.h, // Container height
                        width: 30.w, // Container width
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF7B52C),
                        ),

                        child: Center(
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: IconButton(
                              padding: EdgeInsets.all(0),

                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 20.sp, // Icon size
                              ),
                              onPressed: _pickImageFromCamera,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.all(20.0).r,
                  child: Container(
                    height: 414.h,
                    width: 340.w,
                    color: Color(0xFF2B2B2B),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,

                      child: Column(

                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: 10,).r,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Figtree',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),

                          Container(


                            margin: EdgeInsets.all(1).r,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                            onTap: () {
                              if (!widget.isGenderFixed) {
                                female = true;
                                setState(() {});
                              }
                              },
                                        child: Container(
                                          padding: EdgeInsets.all(10.r),
                                          margin: EdgeInsets.all(10.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: female ? Colors.amber :Colors.grey.shade800),
                                            borderRadius: BorderRadius.circular(5.r),

                                            color:female ? Colors.amber.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 2.w,),
                                              CircleAvatar(
                                                  backgroundColor:Colors.black.withOpacity(0.1) ,
                                                  child:
                                                  Image.asset("assets/images/femalegender.png", color:female ? Colors.amber : Colors.grey ,)
                                                // Icon(
                                                //   Icons.person_2_rounded,
                                                //   size: 20.sp,
                                                //   color: female ? Colors.amber : Colors.grey,
                                                // ),
                                              ),
                                              SizedBox(width: 5.w,),
                                              Text(
                                                ' Female',
                                                textScaleFactor: 1.2.sp,
                                                style: TextStyle(
                                                  fontFamily: 'Figtree',
                                                  fontSize: 12.sp,
                                                  color: female ? Colors.white : Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                                        if (!widget.isGenderFixed) {
                                                          female= false;
                                                          setState(() {});
                                                        }
                                                      },
                                        child: Container(
                                          padding: EdgeInsets.all(10.r),
                                          margin: EdgeInsets.all(10.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(color:female ? Colors.grey.shade800 : Colors.amber),
                                            borderRadius: BorderRadius.circular(5.r),
                                            color:female ? Colors.black.withOpacity(0.1) : Colors.amber.withOpacity(0.1),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 10.w,),
                                              CircleAvatar(
                                                  backgroundColor:Colors.black.withOpacity(0.1),
                                                  child: Image.asset("assets/images/malegender.png",color: female ? Colors.grey : Colors.amber)),
                                              // Icon(
                                              //   CupertinoIcons.person_alt_circle,
                                              //   size: 40.sp,
                                              //   color: female ? Colors.grey : Colors.amber,
                                              // ),
                                              SizedBox(width: 7.w,),
                                              Text(
                                                'Male',
                                                textScaleFactor: 1.2.sp,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Figtree',
                                                  color: female ? Colors.grey : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0).r,
                                    child: Text(
                                      "Full Name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: 300.w,
                                  child: TextFormField(
                                    controller: _FullNameController,

                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Figtree',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      label: Text("Enter full name",style: TextStyle(color: Color(0xFF4E4C4C),fontSize: 12.sp),),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10).r,
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,

                                    ),

                                  ),

                                ),
                                SizedBox(height: 3.h), // Space between the fields
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0).r,

                                    child: Text(
                                      "Relation",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: 300.w,
                                  child: TextFormField(
                                    cursorColor: Color(0xFFF7B52C),
                                    keyboardType: TextInputType.text,

                                    controller: _RelationController,
                                    readOnly: true,
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Figtree',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      // label: Text(
                                      //   "Enter relation",
                                      //   style: TextStyle(color: Color(0xFF4E4C4C), fontSize: 12.sp),
                                      // ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10).r,
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,
                                    ),

                                  ),

                                ),

                                SizedBox(height: 5.h), // Space between the fields
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0).r,
                                    child: Text(
                                      "Mobile Number",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Figtree',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                IntlPhoneField(

                                 controller: _PhoneNumberController,
                                  focusNode: focusNode,
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: 'Figtree',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    label: Text(
                                      "000 000 0000",
                                      style: TextStyle(color: Color(0xFF4E4C4C), fontSize: 12.sp),
                                    ),
                                    fillColor: Colors.black.withOpacity(0.1),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10).r,
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10).r,
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 14.5).r,
                                  ),
                                  languageCode: "en",
                                  initialCountryCode: "IN",
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                  onCountryChanged: (country) {
                                    print('Country changed to: ' + country.name);
                                  },


                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0).r,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Date of Birth",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'figtree',
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w,),
                                        Text("(optional)", style: TextStyle(fontSize: 12,color: Color(0xFF4E4C4C)),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: 300.w,
                                  child: TextFormField(

                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      fontFamily: 'Figtree',
                                    ),
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      label: Text("DD/MM/YYYY",style: TextStyle(fontSize: 12,color: Color(0xFF4E4C4C)),),
                                      suffixIcon: Image.asset("assets/images/calender.png",),
                                      // Icon(
                                      //   Icons.calendar,
                                      //   color: Color(0xFFFFFFFF),
                                      // ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10).r,
                                        borderSide: BorderSide.none,

                                      ),
                                      fillColor: Colors.black.withOpacity(0.1),
                                      filled: true,
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2124),
                                          builder: (BuildContext context, Widget? child){
                                            return Theme(data: ThemeData.light().copyWith(
                                                primaryColor: Color(0xFFF7B52C),
                                                hintColor: Color(0xFF4E4C4C),
                                                colorScheme: ColorScheme.light(
                                                  primary: Color(0xFFF7B52C),
                                                  surface: Color(0xFFF7B52C),
                                                  onSurface: Color(0xFF4E4C4C),
                                                ),
                                                dialogBackgroundColor: Colors.white,
                                                textButtonTheme: TextButtonThemeData(
                                                    style: TextButton.styleFrom(
                                                      primary: Color(0xFF4E4C4C),
                                                    )
                                                )
                                            ), child: child!,);
                                          }

                                      );
                                      if (pickedDate != null) {
                                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                        setState(() {
                                          dateController.text = formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
               // SizedBox(height: 10.h),
                Container(
                  height: 40.h,
                  width: 325.w,
                  decoration: BoxDecoration(
                    //color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: GradientButton(

                    // color: Color(0xFFF7B52C),
                    onPressed: () {

                      if (_FullNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter your Name.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }


                      if (_RelationController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter your Relation.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      if (_PhoneNumberController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter your phone number.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Bottom()));


                    },
                    child: Text(
                      'Add Member',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.h,)
              ],

          ),
        ),
      ),



    );
  }
}
