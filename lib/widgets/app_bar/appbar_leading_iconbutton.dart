import 'package:famlaika1/constants/ImageConstant.dart';
import 'package:famlaika1/constants/sizeutils.dart';
import 'package:famlaika1/widgets/custom_icon_button.dart';
import 'package:famlaika1/widgets/custom_image_view.dart';
import 'package:flutter/cupertino.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
   AppbarLeadingIconbutton({Key? key,
       this.imagePath,
      this.margin,
      this.onTap})


      :super(key: key,);
   String? imagePath;
   EdgeInsetsGeometry? margin;
   Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap?.call();},
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          
          height: 36.adaptSize,
          width: 36.adaptSize,
          padding: EdgeInsets.all(8.h),
          child: CustomImageView(

            imagePath: ImageConstant.imgleftarrow,
          ),
        ),
      ),
    );

  }
}
