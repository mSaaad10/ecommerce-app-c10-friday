import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validation = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String title;
  String hintText;
  TextInputType keyboardType;
  bool isObscureText;
  int? maxLength;
  Validation validator;
  TextEditingController controller;

  CustomTextFormField(
      {required this.title,
        required this.hintText,
        required this.keyboardType,
        this.isObscureText = false, this.maxLength,
        required this.validator,
      required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextFormField(
            controller: controller,
              validator: validator,
              maxLength: maxLength,
              obscureText: isObscureText,
              keyboardType: keyboardType,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: Colors.white,
                  filled: true)),
        ],
      ),
    );
  }
}
