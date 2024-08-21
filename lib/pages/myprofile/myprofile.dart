import 'dart:io';

import 'package:famlaika1/constants/appbarConst.dart';
import 'package:famlaika1/pages/Edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'ImageDetailPage.dart';

class ProfilePage extends StatefulWidget {
  //final List<File> images;
  final File? image;
  final File? postedImage;
  final String? postedText;


  ProfilePage({this.image,this.postedImage, this.postedText, });
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File ? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Do something with the selected image
      print('Image path: ${image.path}');
      // For example, you can use it to update the profile picture
    }
  }

  bool showGallery = true;
  @override
  void initState() {
    super.initState();
    // Set _selectedImage to the postedImage if it's not null
    _selectedImage = widget.postedImage;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: CustomAppBar(title: "My profile",
      actionWidget: IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined,color: Colors.white,)),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFFF7B52C), width: 1),
                            image: DecorationImage(
                              image: AssetImage('assets/images/user.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap:_pickImage,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Alexandra James',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFF8FB021),
                          child: Icon(Icons.check, color: Colors.white, size: 8),
                        ),
                        SizedBox(width: 4),
                        Text('Active', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Spacer(),
                Column(
                  children: [
                    Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Posts',style: TextStyle(color: Color(0xFF949292)),),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text('8', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Groups',style: TextStyle(color: Color(0xFF949292)),),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showGallery = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        gradient: showGallery
                            ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                            : null,
                        color: showGallery ? null : Color(0xFF383838),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                      ),
                      child: Text(
                        'My Gallery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: showGallery ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showGallery = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        gradient: !showGallery
                            ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                            : null,
                        color: !showGallery ? null : Color(0xFF383838),
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                      ),
                      child: Text(
                        'My Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !showGallery ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: showGallery
                  ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 9, // Number of images
                itemBuilder: (context, index) {
                  if (index == 0 && _selectedImage != null) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImageDetailPage(
                                  image: _selectedImage,
                                  text: widget.postedText,
                                ),
                          ),
                        );
                      },
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to ImageDetailPage for other images
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImageDetailPage(
                                  image: _selectedImage,
                                  text: widget.postedText,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.grey.shade300,
                        child: Image.asset('assets/gallery_image_$index.jpg',
                            fit: BoxFit.cover),
                      ),
                    );
                  }
                },
              )
                  : Padding(
                    padding:  EdgeInsets.only(bottom: 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF2B2B2B), // Background color
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: EdgeInsets.all(16.0),

                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Basic Info",style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,

                                            ),),
                                            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute
                                              (builder: (context) => Editprofile()));},
                                                icon: FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF),
                                                    size: 20),),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Row(
                                          children: [
                                            Icon(Icons.phone,color: Colors.grey.shade700,),
                                            SizedBox(width: 8,),
                                            Text('Mobile Number :',style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,),
                                            )

                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 32),
                                        child: Text("+1234567890",style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black87,
                                        ),),

                                        ),
                                        SizedBox(height: 16,),
                                        Row(
                                          children: [Icon(Icons.person,
                                            color: Colors.grey.shade700,),
                                            SizedBox(width: 8,),
                                            Text("Gender: ",style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),)

                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 32),
                                          child: Text(
                                            'Male',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Icon(Icons.cake, color: Colors.grey.shade700),
                                            SizedBox(width: 8),
                                            Text(
                                              'Date of Birth:',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 32),
                                          child: Text(
                                            '01-01-1990',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8,)


                                      ],
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
