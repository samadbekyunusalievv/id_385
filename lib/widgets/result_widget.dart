import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultWidget extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback onPlayAgain;
  final VoidCallback onExit;

  ResultWidget({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.onPlayAgain,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 112.h),
          Image.asset(
            'assets/images/endgame.png',
            width: 237.24.w,
            height: 159.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24.h),
          Text(
            'Books guessed:',
            style: GoogleFonts.crimsonText(
              textStyle: TextStyle(
                fontSize: 32.r,
                fontWeight: FontWeight.w400,
                height: 35.2 / 32,
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Text(
            '$correctAnswers of $totalQuestions',
            style: GoogleFonts.crimsonText(
              textStyle: TextStyle(
                fontSize: 48.r,
                fontWeight: FontWeight.w600,
                height: 52.8 / 48,
                color: Color.fromRGBO(0, 174, 59, 1),
                shadows: [
                  Shadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            'Not bad!',
            style: GoogleFonts.crimsonText(
              textStyle: TextStyle(
                fontSize: 32.r,
                fontWeight: FontWeight.w400,
                height: 35.2 / 32,
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 112.h),
          SizedBox(
            width: 327.w,
            height: 52.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ElevatedButton(
                    onPressed: onPlayAgain,
                    child: Text(
                      'Play again?',
                      style: GoogleFonts.crimsonText(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          height: 26.h / 20.h,
                          color: Color.fromRGBO(85, 73, 209, 1),
                        ),
                      ),
                    ),
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
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
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
              ],
            ),
          ),
          SizedBox(height: 20.h),
          TextButton(
            onPressed: onExit,
            child: Text(
              'Exit',
              style: GoogleFonts.crimsonText(
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  height: 26.h / 20.h,
                  color: Color.fromRGBO(85, 73, 209, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
