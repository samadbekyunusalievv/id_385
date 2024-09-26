import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showButtons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 235, 245, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 205.h),
              Text(
                'BookBud:',
                style: GoogleFonts.crimsonText(
                  fontSize: 64.r,
                  fontWeight: FontWeight.w700,
                  height: 83.19 / 64,
                  color: Color.fromRGBO(85, 73, 209, 1),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                'short notes',
                style: GoogleFonts.crimsonText(
                  fontSize: 32.r,
                  fontWeight: FontWeight.w400,
                  height: 41.59 / 32,
                  color: Color.fromRGBO(169, 128, 187, 1),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              Image.asset(
                'assets/images/book_image.png',
                width: 253.75.w,
                height: 169.61.h,
              ),
              SizedBox(height: 99.h),
              SizedBox(
                width: 327.w,
                height: 52.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Visibility(
                        visible: _showButtons,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: ElevatedButton(
                          onPressed: () {
                            _showNotificationDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(236, 235, 245, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r),
                              side: BorderSide(
                                color: Color.fromRGBO(85, 73, 209, 1),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: GoogleFonts.crimsonText(
                              fontSize: 20.r,
                              fontWeight: FontWeight.w700,
                              height: 26 / 20,
                              color: Color.fromRGBO(85, 73, 209, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Visibility(
                        visible: _showButtons,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: SizedBox(
                          width: 16.w,
                          height: 18.h,
                          child: Image.asset(
                            'assets/images/element.png',
                            width: 16.w,
                            height: 18.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: _showButtons,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms of Use',
                          style: GoogleFonts.crimsonText(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 18.2 / 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showButtons,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy Policy',
                          style: GoogleFonts.crimsonText(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 18.2 / 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showNotificationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            backgroundColor: const Color.fromRGBO(48, 48, 48, 1),
            child: Container(
              padding: EdgeInsets.zero,
              width: 270.w,
              height: 176.h,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        "“BookBud: short notes” Would\nLike to Send You Notifications",
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 17.r,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: -0.41,
                          height: 22.h / 17.r,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Notifications can include alerts,\n sounds, and icons. You can customize\n them in Settings.",
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 13.r,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.08,
                          color: Colors.white,
                          height: 16.h / 13.r,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.r),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20.w),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()),
                                );
                              },
                              child: Text(
                                "Don't allow",
                                style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  color: Colors.blue,
                                  fontSize: 17.r,
                                  height: 22.h / 17.r,
                                ),
                              ),
                            ),
                            SizedBox(width: 54.w),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()),
                                );
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  color: Colors.blue,
                                  fontSize: 17.r,
                                  height: 22.h / 17.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 132.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1.h,
                      color: const Color.fromRGBO(255, 255, 255, 0.2),
                    ),
                  ),
                  Positioned(
                    top: 132.h,
                    left: 135.w,
                    bottom: 0,
                    child: Container(
                      width: 1.w,
                      color: const Color.fromRGBO(255, 255, 255, 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
