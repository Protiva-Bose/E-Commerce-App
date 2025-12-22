import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/profile.png'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hi, Protiva',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_location_outlined,
                  color: Colors.white,
                  size: 14.sp,
                ),
                Text(
                  'Chenango,New York',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35.w,
              height: 30.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    right: 5.w,
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 5.w,
                    right: 7.w,
                    child: Icon(
                      Icons.circle,
                      color: Colors.red.shade900,
                      size: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.6],
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
