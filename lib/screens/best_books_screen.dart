import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/book_data.dart';
import '../models/book.dart';
import '../widgets/custom_app_bar.dart';

class BestBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 235, 245, 1),
      appBar: CustomAppBar(
        title: 'Best books',
        showBackButton: true,
        showSettingsIcon: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/banner.png',
                width: 375.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 14.h),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 25.w,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 1.w,
                        color: Color.fromRGBO(169, 128, 187, 0.2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 34.w, right: 25.w),
                      child: ListView.builder(
                        itemCount: bestBooks.length,
                        itemBuilder: (context, index) {
                          final Book book = bestBooks[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Container(
                              width: 315.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(169, 128, 187, 0.2),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title,
                                    style: GoogleFonts.crimsonText(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 26.4 / 24,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    book.author,
                                    style: GoogleFonts.crimsonText(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 22 / 20,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    book.description,
                                    style: GoogleFonts.crimsonText(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 17.6 / 16,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
            left: 31.w,
            top: 504.h,
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
