
import 'package:famlaika1/constants/DisplaySibling.dart';
import 'package:famlaika1/constants/appbarConst.dart';
import 'package:famlaika1/constants/home2appbar.dart';
import 'package:famlaika1/pages/homefamilytree/deletemember_view.dart';
import 'package:famlaika1/pages/homefamilytree/fatherfamtree.dart';
import 'package:famlaika1/pages/myprofile/myprofile.dart';
import 'package:famlaika1/pages/homefamilytree/sibingfamilytree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../constants/bottom.dart';
import '../../constants/colors.dart';
import '../../widgets/Custom_BottomLeftCurveClipper.dart';
import '../chat_view.dart';
import '../myprofile/CustomListTile.dart';
import '../post_view_bottom/createpost_view.dart';
import '../post_view_bottom/post_view.dart';
import 'Editoraddmember_view.dart';
import '../galleryaccesspages/galleryAccessMain.dart';


class Home2 extends StatefulWidget {
  const Home2({super.key});
  @override
  State<Home2> createState() => _Home2State();
}
class _Home2State extends State<Home2> {





  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
      // Handle the picked image
    }
  }

  List<String> siblingimages = [
    "assets/images/img_listsibling2.png",
    "assets/images/img_listsibling3.png",
    "assets/images/img_listsibling4.png",
    "assets/images/img_listsiblig.png",
    "assets/images/img_intersect_3.png",
    "assets/images/img_intersect_1.png"
  ];
  String currentMeImage="assets/images/img_me.png";
  String currentMeName="Current me";
  List<String> siblingnames = ["Ancy Tom", "James Tom", "Tomy Tom", "Christopher", "Antony Tom","Tony Tom"];
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: Home2AppBar(
          titleImage: "assets/images/img_logo.png",
          showActions: true,
        ),
   // bottomNavigationBar: Bottom(),
    drawer: Container(
      width: 250.w,
      child: Drawer(
        backgroundColor: AppColors.primaryColor,
        child: ListView(

          children: [
            Container(
              height: 85.r,
              decoration: BoxDecoration(
                  color: Colors.black

              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(),
                    image: DecorationImage(
                      image: AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text("Alexandra James", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'Figtree',
                    color: Color(0xFFFFFFFF)),),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.lightGreen,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.r),
                    Text(
                      "Active",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),

            ),
            CustomListTile(
              leadingIcon: const Icon(
                Icons.account_circle, color: Colors.white,),
              title: ' My Profile ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );

              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.near_me_outlined, color: Color(0xFFFFFFFF)),
              title: const Text(' Request ',
                  style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo, color: Color(0xFFFFFFFF)),
              title: const Text(' Gallery Access ',
                  style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryaccessMain()),
                );
                },
            ),
            ListTile(
              leading: const Icon(
                  Icons.description, color: Color(0xFFFFFFFF)),
              title: const Text(' Activity ',
                  style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.person_add_alt_1, color: Color(0xFFFFFFFF)),
              title: const Text(' Invite Person ',
                  style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.settings, color: Color(0xFFFFFFFF)),
              title: const Text(
                  'Settings', style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 220)),

            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFFFFFFF)),
              title: const Text('Log Out',
                  style: TextStyle(color: Color(0xFFFFFFFF))),
              onTap: () {
                // Handle logout action here
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    ),


        body:


        SafeArea(


          child: SingleChildScrollView(
            child: Stack(
              children: [
                //_pages[_currentIndex],

                Column(
                  children: [
                    Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF262626),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.0.w,bottom: 26.h,left: 16.w,),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(

                                children: [
                                  GestureDetector(
                                    onTap:(){ Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CreatePostPage(),
                                      ),
                                    );},

                                    child: CircleAvatar(
                                      radius: 40.r,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: AssetImage('assets/images/user.png'),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () => _pickImage(context),
                                      child: Container(
                                        height: 24.h,
                                        width: 24.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFF7B52C),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CreatePostPage(),
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.add, size: 10.sp, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0.h,
                              left: 0,
                              top: 106.h,
                              child: Text(
                                "Your Story",
                                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
          
                      height: 70.h,
          
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w,top: 25.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your Family",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontFamily: 'Figtree',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Text(
                                  "2 Member",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'Figtree',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),height: 1.36.h
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                          icon: FaIcon(FontAwesomeIcons.penToSquare, color: Color(0xFFFFFFFF), size: 20),
                         onPressed: (){
                            showCustomSnackBar(context);
                         },
          

                          ),
          
                        ],
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
          

                            ),
                            Positioned(
                                top:0.148.sh,
                                //MediaQuery.of(context).size.height * 0.15.h,
                                left: 0.53.sw-(0.01.sw),
          
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
                                left:0.25.sw,
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
                                  cheight: 0.110.sh,
                                  //MediaQuery.of(context).size.height * 0.115,
                                )
          
                            ),
                            Positioned(
                              top: 0.65.sh, // Same as child positions
                              left: 0.34.sw, // Starting point of the horizontal line
                              child: Container(
                                height: 1.h, // Thickness of the line
                                width:
                                0.388.sw, // Length of the horizontal line
                                color: Color(0xFFF7B52C), // Line color
                              ),
                            ),///horizontal
                            Positioned(
                              top: 0.65.sh, // Same as horizontal line
                              left: 0.34.sw, // Starting point for vertical line
                              child: Container(
                                height: 20.h, // Height of the vertical line
                                width: 1.w, // Thickness of the line
                                color: Color(0xFFF7B52C), // Line color
                              ),
                            ),///verti
                            Positioned(
                              top: 0.65.sh, // Same as horizontal line
                              left: 0.73.sw - 2.w, // Ending point for vertical line
                              child: Container(
                                height: 20.h, // Height of the vertical line
                                width: 1.w, // Thickness of the line
                                color: Color(0xFFF7B52C), // Line color
                              ),
                            ),///vertical
          
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
                                  isEditoraddmember: false,
                                  isDeleteMember: false, relationType: '',
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
                              ),
                            ),
          
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Siblingfamtree(
                                              siblingImage: siblingimages[index],
                                              siblingName: siblingnames[index],
                                            ),
                                          ),
                                        );
                                        change();
                                        setState(() {

                                        });
                                      },
                                      child: Align(
                                        widthFactor: widthFactor,
                                        child: DisplaySmallWidget(
                                          simagehgt: 40.h,
                                          simagewdt: 40.w,
                                          simagebradius: 20.r, siblingname: '',
                                          sinblingimage: AssetImage(siblingimages[index]),
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
                                          selected = true;});
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
                                    },
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: siblingimages.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Siblingfamtree(
                                                siblingImage: siblingimages[index],
                                                siblingName: siblingnames[index],
                                                // meImage:currentMeImage,
                                                // meName:currentMeName,
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            selected = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 2.0,right:30),
                                          child: Container(
                                            height:0.1.sh + 80.h,
                                            //MediaQuery.of(context).size.height * 0.1 + 80,
                                            width: 120.w,
                                            child: Stack(children: [
                                              Positioned(
                                                top: 4.h,
                                                left: 55.w,
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
                                                  isEditoraddmember: false,
                                                  isDeleteMember: false, relationType: '',
                                                ),
                                              ),
                                            ]),
                                          ),
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
                                isEditoraddmember: false,
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_father.png',
                                persongname: 'Tom Hanks',
                                personrelation: 'Father',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FatherFamilyTreePage()),
                                  );
                                }  ,
                              ),), // father
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
                                isEditoraddmember: false,
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_mother.png',
                                persongname: 'Victoria Tom',
                                personrelation: 'Mother',
                              ),
                            ), // mother
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
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_me.png',
                                persongname: 'Me',
                                personrelation: '',
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
                                isEditoraddmember: false,
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_spouse.png',
                                persongname: 'Charles James', relationType: 'Spouse',
                                personrelation: 'Spouse',
                              ),
                            ), //spouse
                            Positioned(
                              top: 0.66.sh,
                              //MediaQuery.of(context).size.height * 0.63,
                              left: 0.34.sw- 55.w,
                              //(MediaQuery.of(context).size.width * 0.5) - 55,
                              child: DisplaySibling(
                                imagehgt: 50.h,
                                imagewdt: 58.w,
                                imagebradius: 40.r,
                                cthgt: 46.h,
                                ctwdt: 120.w,
                                isEditoraddmember: false,
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_child.png',
                                persongname: 'Zera Charles',
                                personrelation: 'Child',
                              ),
                            ),
                            /// child




                            Positioned(
                              top: 0.66.sh, // Adjust according to vertical line length
                              left: 0.73.sw - 55.w, // Adjust the horizontal position
                              child: DisplaySibling(
                                imagehgt: 50.h,
                                imagewdt: 58.w,
                                imagebradius: 40.r,
                                cthgt: 46.h,
                                ctwdt: 120.w,
                                isEditoraddmember: false,
                                isDeleteMember: false,
                                imageUrl: 'assets/images/img_8.png',
                                persongname: 'Aleena Charles',
                                personrelation: 'Child',
                              ),
                            ),
                          ],)),
                    // Container(
                  ],
                ),

              ],),),),

//bottom
// bottomNavigationBar: CustomBottomNavigationBar(
//   currentIndex: _currentIndex,
//   onTap: (index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   },
// ),
      ),
    );
  }
  void showCustomSnackBar(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
     overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 0, // Adjust this value to sit above the bottom navigation bar
        left: 0,
        right: 0,
        child: Material(
          elevation: 6.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),

              ), border: Border.all(
                color: Colors.grey.shade800,
                width: 2.r
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Modify Family Tree',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.xmark_circle, color: Colors.white),
                      onPressed: () {
                        overlayEntry.remove();
                      },
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                Row(children: [
                    Image.asset("assets/images/addicon.png",height: 20.h,),
                    //Icon(Icons.crop_free, color: Colors.white),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> Editoraddmember()));
                        // Add your edit/add member action here
                        overlayEntry.remove();
                      },
                      child: Text('Edit / Add Member', style: TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(CupertinoIcons.delete_simple, color: Colors.white),
                    SizedBox(width: 8),
                    TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> DeleteMember()));
                        // Add your delete member action here
                        overlayEntry.remove();},
                      child: Text('Delete Member', style: TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
     );
     overlay?.insert(overlayEntry);
    // Remove the overlay after a few seconds
    Future.delayed(Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }
}









