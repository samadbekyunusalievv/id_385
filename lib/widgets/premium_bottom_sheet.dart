import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumBottomSheet extends StatelessWidget {
  const PremiumBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344.w,
          height: 245.h,
          decoration: BoxDecoration(
            color: Color.fromRGBO(169, 128, 187, 1),
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: Colors.black,
              width: 1.w,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20.r,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                "No more ADS",
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
                "for \$0.49",
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
                width: 300.w,
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
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/premium');
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
                          'Go to Premium',
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
            ],
          ),
        ),
        Positioned(
          top: 1.3.h,
          left: 1.1.w,
          child: Image.asset(
            'assets/images/premium_book.png',
            width: 68.w,
            height: 75.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
