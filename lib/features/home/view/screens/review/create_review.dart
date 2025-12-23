import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/custom_textfield.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:   Text('Create Review'),
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios)),
    ),
        backgroundColor: Colors.white,
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),

                CustomTextFormField(
                  hintText: 'First Name',
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  hintText: 'Last Name',
                  keyboardType: TextInputType.emailAddress,
                ),

                CustomTextFormField(
                    hintText: 'Write Review',
                    obscureText: true,
                    maxLines: 3
                ),

                ElevatedButton(onPressed: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ParentScreen()));
                }, child: Center(
                  child: Text('Submit',style: TextStyle(color: Colors.white),),
                ))
              ],
            ),
          ),
        )
    );
  }
}