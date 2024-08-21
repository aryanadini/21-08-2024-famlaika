import 'package:famlaika1/constants/appbarConst.dart';
import 'package:flutter/material.dart';

import 'Tileofgalleryaccess.dart';
import 'gradientgalleryAccess.dart';

class GalleryaccessMain extends StatefulWidget {
  @override
  _GalleryaccessMainState createState() => _GalleryaccessMainState();
}

class _GalleryaccessMainState extends State<GalleryaccessMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: CustomAppBar(title: "Gallery Access"),
      body: Column(
        children: [
          SizedBox(height: 20),
          GradientGalleryAccess(),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return RequestListTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
