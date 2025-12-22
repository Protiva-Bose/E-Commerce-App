import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServiceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final Color leadingContainerColor;
  final bool showCalendarIcon;
  final VoidCallback? onCalendarTap;

  const CustomServiceAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.iconColor,
    required this.leadingContainerColor,
    this.showCalendarIcon = false,
    this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,

      leading: Padding(
        padding: EdgeInsets.only(left: 8.w, top: 4.h),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: leadingContainerColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsets.all(8.w),
            child: Icon(Icons.arrow_back, color: iconColor),
          ),
        ),
      ),

      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: [
        if (showCalendarIcon)
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: onCalendarTap,
              child: Icon(Icons.calendar_month, color: iconColor, size: 24.sp),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
