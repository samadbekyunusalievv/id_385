import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarsOverlay extends StatelessWidget {
  final bool isGameOver;
  final bool isAnswered;
  final bool isCorrect;

  StarsOverlay({
    required this.isGameOver,
    required this.isAnswered,
    required this.isCorrect,
  });

  List<Widget> _buildStars() {
    if (isGameOver) {
      return [
        Positioned(
          top: 7.h,
          left: 57.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          right: 24.w,
          top: 342.h,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          left: 18.w,
          bottom: 225.h,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
      ];
    } else if (isAnswered && isCorrect) {
      return [
        Positioned(
          top: 185.h,
          right: 13.54.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          left: 48.w,
          top: 470.h,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          right: 60.w,
          bottom: 170.h,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
      ];
    } else if (isAnswered && !isCorrect) {
      return [
        Positioned(
          top: 21.h,
          right: 30.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          top: 58.h,
          left: 65.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
        Positioned(
          top: 258.h,
          left: 18.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
      ];
    } else {
      return [
        Positioned(
          top: 41.h,
          left: 37.w,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
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
          left: 55.w,
          bottom: 85.h,
          child: Image.asset(
            'assets/images/star.png',
            width: 6.46.w,
            height: 10.01.h,
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildStars(),
    );
  }
}
