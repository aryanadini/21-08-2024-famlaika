import 'package:famlaika1/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class AppbarSubtitleFive extends StatelessWidget {
   AppbarSubtitleFive({Key? key,
     required this.text, this.margin, this.onTap})

     :super(key: key,);
   String text;
   EdgeInsetsGeometry? margin;
   Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap?.call();
      },
      child: Padding(
        padding: margin?? EdgeInsets.zero,
        child: Text(text,style: theme.textTheme.bodyMedium!.copyWith(
          color: appTheme.whiteA700
        ),),
      ),
    );
  }
}
