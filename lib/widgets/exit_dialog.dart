import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExitDialog extends StatelessWidget {
  final VoidCallback onLeave;
  final VoidCallback onCancel;

  const ExitDialog({
    Key? key,
    required this.onLeave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 156.h,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    "BookBud: short notes style",
                    style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 17.r,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -0.408,
                      height: 22 / 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Are you sure you want to leave?\nAll questions will have to be\nretaken.',
                    style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 13.r,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.08,
                      color: Colors.white,
                      height: 16 / 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: onLeave,
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.408,
                                color: Colors.red,
                                height: 22 / 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: onCancel,
                            child: Text(
                              "No",
                              style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.408,
                                color: Colors.blue,
                                height: 22 / 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 112.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 1.h,
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                ),
              ),
              Positioned(
                top: 112.h,
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
  }
}
