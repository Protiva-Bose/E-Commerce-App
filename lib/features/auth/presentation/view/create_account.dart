import 'package:e_commerce_app/features/parent/view/parent_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_textfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 80.w,
                height: 80.h,
              ),
              Text(
                'Complete Profile',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),

              Text(
                'Get started with us with your details',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10.h),

              CustomTextFormField(
                hintText: 'First Name',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hintText: 'Last Name',
                keyboardType: TextInputType.emailAddress,
              ),

              CustomTextFormField(
                hintText: 'Mobile',
                keyboardType: TextInputType.emailAddress,
              ),

              CustomTextFormField(
                hintText: 'City',
                keyboardType: TextInputType.emailAddress,
              ),

              CustomTextFormField(
                hintText: 'Shipping Address',
                obscureText: true,
                maxLines: 3,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ParentScreen()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Complete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}