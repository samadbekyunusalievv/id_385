import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsOn = false;
  bool isPremium = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotificationsOn = prefs.getBool('isNotificationsOn') ?? false;
      isPremium = prefs.getBool('isPremium') ?? false;
    });
  }

  Future<void> _toggleNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNotificationsOn', !isNotificationsOn);
    setState(() {
      isNotificationsOn = !isNotificationsOn;
    });
  }

  Future<void> _setPremiumStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', status);
    setState(() {
      isPremium = status;
    });
  }

  Future<void> _handleGoToPremium() async {
    await Navigator.pushNamed(context, '/premium');
    _loadSettings();
  }

  Future<void> _handlePrivacyPolicy() async {
    await _setPremiumStatus(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 235, 245, 1),
      appBar: CustomAppBar(
        title: 'Settings',
        showBackButton: true,
        showSettingsIcon: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Container(
                  height: 58.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color.fromRGBO(236, 235, 245, 1),
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(208, 208, 208, 1),
                        width: 3.w,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: GoogleFonts.crimsonText(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            height: 26.4 / 24,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleNotifications,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 42.r,
                            height: 28.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.w,
                              ),
                              color: isNotificationsOn
                                  ? Color.fromRGBO(169, 128, 187, 0.3)
                                  : Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Align(
                                alignment: isNotificationsOn
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 24.r,
                                  height: 24.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                    color: isNotificationsOn
                                        ? Color.fromRGBO(169, 128, 187, 1)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Privacy Policy',
                        style: GoogleFonts.crimsonText(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 20.8 / 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.r,
                        color: Colors.black,
                      ),
                      onTap: _handlePrivacyPolicy,
                    ),
                    SizedBox(height: 20.h),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Terms of Use',
                        style: GoogleFonts.crimsonText(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 20.8 / 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.r,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                if (!isPremium)
                  Center(
                    child: SizedBox(
                      width: double.infinity,
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
                          onPressed: _handleGoToPremium,
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
                                'Go to premium',
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
                  ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
          Positioned(
            right: 7.54.w,
            top: 273.h,
            child: Image.asset(
              'assets/images/star.png',
              width: 6.46.w,
              height: 10.01.h,
            ),
          ),
          Positioned(
            right: 65.w,
            bottom: 182.h,
            child: Image.asset(
              'assets/images/star.png',
              width: 6.46.w,
              height: 10.01.h,
            ),
          ),
          Positioned(
            left: 55.w,
            bottom: 89.h,
            child: Image.asset(
              'assets/images/star.png',
              width: 6.46.w,
              height: 10.01.h,
            ),
          ),
        ],
      ),
    );
  }
}
