import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_app_bar.dart';

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  Future<void> _setPremiumStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', status);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 235, 245, 1),
      appBar: CustomAppBar(
        title: 'Premium',
        showBackButton: true,
        showSettingsIcon: false,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65.h),
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
            SizedBox(height: 64.h),
            Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(169, 128, 187, 1),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 22.h),
                      Text(
                        'No more ADS',
                        style: GoogleFonts.crimsonText(
                          fontSize: 24.r,
                          fontWeight: FontWeight.w400,
                          height: 26.4 / 24,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'for \$0.49',
                        style: GoogleFonts.crimsonText(
                          fontSize: 48.r,
                          fontWeight: FontWeight.w600,
                          height: 52.8 / 48,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 22.h),
                      SizedBox(
                        width: 327.w,
                        height: 52.h,
                        child: Container(
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
                              _setPremiumStatus(true);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get a purchase',
                                  style: GoogleFonts.crimsonText(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    height: 26 / 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.auto_awesome_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              _setPremiumStatus(false);
                            },
                            child: Text(
                              'Terms of Use',
                              style: GoogleFonts.crimsonText(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 18.2 / 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _setPremiumStatus(true);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Restore',
                              style: GoogleFonts.crimsonText(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 18.2 / 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _setPremiumStatus(false);
                            },
                            child: Text(
                              'Privacy Policy',
                              style: GoogleFonts.crimsonText(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 18.2 / 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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
