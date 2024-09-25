import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int recordCorrectAnswers = 0;

  @override
  void initState() {
    super.initState();
    _loadRecord();
  }

  Future<void> _loadRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recordCorrectAnswers = prefs.getInt('lastCorrectAnswers') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(236, 235, 245, 1),
        appBar: CustomAppBar(
          title: 'Menu',
          showBackButton: false,
          showSettingsIcon: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 319.w,
                      height: 142.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(169, 128, 187, 0.2),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          width: 1.w,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/images/synopsis_image.png',
                              width: 147.w,
                              height: 122.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, top: 15.h, right: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Synopsis',
                                  style: GoogleFonts.crimsonText(
                                    textStyle: TextStyle(
                                      fontSize: 20.r,
                                      fontWeight: FontWeight.w600,
                                      height: 22 / 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Your record: $recordCorrectAnswers of 50',
                                  style: GoogleFonts.crimsonText(
                                    textStyle: TextStyle(
                                      fontSize: 14.r,
                                      fontWeight: FontWeight.w400,
                                      height: 15.4 / 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 29.h),
                                Container(
                                  width: 117.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(85, 73, 209, 1),
                                    borderRadius: BorderRadius.circular(2.r),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(34, 22, 158, 1),
                                        width: 3.w,
                                      ),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await Navigator.pushNamed(
                                          context, '/synopsis');
                                      _loadRecord();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.r),
                                      ),
                                      padding: EdgeInsets.zero,
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Let\'s play',
                                          style: GoogleFonts.crimsonText(
                                            textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              height: 20.8 / 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 16.sp,
                                          color: Colors.white,
                                        ),
                                      ],
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
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 319.w,
                      height: 142.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(169, 128, 187, 0.2),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          width: 1.w,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/images/best_books_image.png',
                              width: 155.w,
                              height: 122.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, top: 15.h, right: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Best books',
                                  style: GoogleFonts.crimsonText(
                                    textStyle: TextStyle(
                                      fontSize: 20.r,
                                      fontWeight: FontWeight.w600,
                                      height: 22 / 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'The best books of the 21st\ncentury!',
                                  style: GoogleFonts.crimsonText(
                                    textStyle: TextStyle(
                                      fontSize: 14.r,
                                      fontWeight: FontWeight.w400,
                                      height: 15.4 / 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 14.h),
                                Container(
                                  width: 117.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(85, 73, 209, 1),
                                    borderRadius: BorderRadius.circular(2.r),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(34, 22, 158, 1),
                                        width: 3.w,
                                      ),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/best-books');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.r),
                                      ),
                                      padding: EdgeInsets.zero,
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Let\'s see',
                                          style: GoogleFonts.crimsonText(
                                            textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              height: 20.8 / 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 16.sp,
                                          color: Colors.white,
                                        ),
                                      ],
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
                ],
              ),
            ),
            Positioned(
              top: 273.h,
              right: 7.54.w,
              child: Image.asset(
                'assets/images/star.png',
                width: 6.46.w,
                height: 10.01.h,
              ),
            ),
            Positioned(
              bottom: 163.h,
              right: 50.w,
              child: Image.asset(
                'assets/images/star.png',
                width: 6.46.w,
                height: 10.01.h,
              ),
            ),
            Positioned(
              bottom: 88.h,
              left: 55.w,
              child: Image.asset(
                'assets/images/star.png',
                width: 6.46.w,
                height: 10.01.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
