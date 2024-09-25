import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showSettingsIcon;
  final VoidCallback? onBackButtonPressed;

  CustomAppBar({
    required this.title,
    this.showBackButton = false,
    this.showSettingsIcon = true,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Color.fromRGBO(231, 228, 255, 1),
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.chevron_back,
                  size: 20.r,
                  color: Colors.black,
                ),
                onPressed: onBackButtonPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: showSettingsIcon
          ? [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/setting.png',
                    width: 24.r,
                    height: 24.r,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ),
            ]
          : null,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
