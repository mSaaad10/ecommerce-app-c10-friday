import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String buttonTitle;
  VoidCallback onPressed;
  CustomButton({required this.buttonTitle, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 172, vertical: 23)
        ),
        onPressed: () {
          onPressed();
        }, child: Text(buttonTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue.shade900),));
  }
}
