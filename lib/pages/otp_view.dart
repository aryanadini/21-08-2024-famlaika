import 'dart:convert';
import 'dart:developer';

import 'package:famlaika1/pages/personalinfo_view.dart';
import 'package:famlaika1/widgets/GradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/appbarConst.dart';
import '../constants/colors.dart';

class Otp extends StatefulWidget {
  final String phoneNumber;

  Otp({super.key, required this.phoneNumber});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _pinPutController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinPutController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 58.w,
      height: 58.h,
      textStyle: TextStyle(
        fontFamily: 'Figtree',
        fontSize: 20.sp,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(56, 56, 56, 1)),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(47, 47, 47, 1)),
      borderRadius: BorderRadius.circular(8.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(56, 56, 56, 1),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: 'OTP Verification' ,
          // backgroundColor: Colors.grey.shade900,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFFFFFF)),
          // ),
          // title: Text(
          //   "OTP Verification",
          //   style: TextStyle(
          //     color: Color(0xFFFFFFFF),
          //     fontSize: 22.sp,
          //     fontFamily: 'Figtree',
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * double.maxFinite,
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  //color: Colors.pinkAccent,
                  height: 65.h,
                  width: 260.w,
                  margin: EdgeInsets.only(right: 98.w),
                  child:RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Enter the OTP code sent to your\n',
                        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp,fontWeight: FontWeight.w400,),
                      ),
                      TextSpan(text: 'registered mobile number.',
                        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp,fontWeight: FontWeight.w400,height: 1.36.h),
                      )
                    ]

                  ),

                  )
                  // Text(
                  //   "Enter the OTP code sent to \nyour registered mobile number.",
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     fontFamily: 'Figtree',
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 16.sp,
                  //     color: Color(0xFFFFFFFF),
                  //     height: 1.38,
                  //   ),
                  // ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      height: 90.h,
                      //color: Colors.pinkAccent,
                      child: Pinput(
                        controller: _pinPutController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Didn't receive OTP? ",
                                style: TextStyle(color: Color(0xFFFFFFFF),
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                              ),
                              TextSpan(
                                text: "Resend",
                                style: TextStyle(
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Color(0xFFF7B52C),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 75.h),
                  Container(
                    height: 40.h,
                    width: 328.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(243, 128, 43, 1),
                          Color(0xFFFAE42C),
                        ],
                      ),
                    ),
                    child: GradientButton(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Color(0xFF1E1E1E),
                        ),
                      ),
                      //color: Color(0xFFF7B52C),
                      onPressed: () {
                        if (_pinPutController.text.isEmpty) {
                          // Show a dialog or snackbar indicating that the phone number field is required
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter Otp.'),
                              backgroundColor: Colors.red, // You can customize the color
                            ),
                          );
                          return; // Exit the function if the phone number field is empty
                        }

                        verifyOtp(_pinPutController.text, widget.phoneNumber);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Personalinfo()),
                        );

                        focusNode.unfocus();
                        formKey.currentState!.validate();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(String otp, String phoneNumber) async {
    try {
      // Your API endpoint URL
      String apiUrl = 'http://famlaika.com/verify_otp';

      // Data to be sent in the request body
      Map<String, String> requestBody = {
        'otp': otp,
        'phone_number': phoneNumber,
      };

      // Send POST request to API endpoint
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      // Handle response
      if (response.statusCode == 200) {
        // Successful request
        var responseBody = jsonDecode(response.body);
        // Check the response body for verification status
        bool isOtpValid = responseBody['is_otp_valid'];
        if (isOtpValid) {
          // OTP is valid
          print('OTP verified successfully');
          // TODO: Perform navigation to the next screen or execute any desired action upon successful OTP verification
        } else {
          // OTP is invalid
          print('OTP verification failed');
          // TODO: Handle invalid OTP scenario (e.g., display an error message to the user)
        }
      } else {
        // Request failed
        print('Failed to verify OTP. Status code: ${response.statusCode}');
        // TODO: Handle failed API request scenario (e.g., display an error message to the user)
      }
    } catch (error) {
      // Handle error
      print('Error verifying OTP: $error');
      // TODO: Handle error scenario (e.g., display an error message to the user)
    }
  }
}
