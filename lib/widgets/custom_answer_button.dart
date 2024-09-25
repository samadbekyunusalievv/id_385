import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color borderBottomColor;

  const CustomAnswerButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderBottomColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
          border: Border(
            bottom: BorderSide(
              color: borderBottomColor,
              width: 3.h,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.crimsonText(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
