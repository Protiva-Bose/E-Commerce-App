import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuListTile extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final VoidCallback onTap;

  const MenuListTile({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(
          svgIconPath,color: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
              color: Colors.black
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.grey,
          size: 20.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      ),
    );
  }
}
