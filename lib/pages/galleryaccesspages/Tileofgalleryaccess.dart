import 'dart:async';

import 'package:famlaika1/widgets/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestListTile extends StatefulWidget {
  @override
  _RequestListTileState createState() => _RequestListTileState();
}

class _RequestListTileState extends State<RequestListTile> {
  bool _isAccepted = false;
  Duration _timerDuration = Duration(minutes: 30);
  late final Timer _timer;
  String _timeRemaining = '30:00';

  @override
  void initState() {
    super.initState();
    if (_isAccepted) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerDuration.inSeconds > 0) {
          final int minutes = _timerDuration.inMinutes;
          final int seconds = _timerDuration.inSeconds % 60;
          _timeRemaining = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
          _timerDuration = _timerDuration - Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart ,
      background: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(padding:
          EdgeInsets.symmetric(horizontal: 16.w),
          child:Icon(Icons.delete, color: Colors.red,size: 40.sp,) ,
          ),

        ),
      ),
      onDismissed:(direction) {
        // Handle item dismissal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Request deleted')),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(color: Color(0xFF2B2B2B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700)
        ),

        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/user_image.jpg'),
            radius: 24,
          ),
          title: Text('Name',style: TextStyle(color: Color(0xFFFFFFFF)),),
          subtitle: _isAccepted
              ? null
              : null,  // No subtitle when not accepted
          trailing: _isAccepted
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Time is end in:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E4C4C),
                ),
              ),
              SizedBox(height: 4),
              Text(
                _timeRemaining,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF), // Color for the timer
                ),
              ),
            ],
          )
          :GradientButton(onPressed: (){
            setState(() {
              _isAccepted=true;
              _startTimer();
            });
          },
              child: Text("Accept")),

          onLongPress: () {
            // Optionally, handle long press for deletion
          },
        ),
      ),
    );
  }
}
