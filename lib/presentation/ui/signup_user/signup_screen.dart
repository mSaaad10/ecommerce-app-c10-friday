import 'package:ecommerce_app_c10_frida/core/strings_manager.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_button.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //ImageIcon(AssetImage('assets/images/route_icon.png'), color: Colors.white, size:140),
                SvgPicture.asset(
                  'assets/images/route_icon_svg.svg',
                  height: 71.h,
                  width: 237.w,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                SizedBox(
                  height: 68.h,
                ),

                CustomTextFormField(
                  title: StringsManager.fullName,
                  hintText: StringsManager.nameHint,
                  keyboardType: TextInputType.text,
                  controller: fullNameController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter full name';
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  title: StringsManager.mobileNumber,
                  hintText: StringsManager.mobileHint,
                  keyboardType: TextInputType.phone,
                  isObscureText: false,
                  maxLength: 11,
                  controller: mobileController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter mobile number';
                    }
                    if (input.length < 11) {
                      return 'Not valid mobile number';
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  title: StringsManager.emailAddress,
                  hintText: StringsManager.emailHint,
                  keyboardType: TextInputType.number,
                  isObscureText: false,
                  controller: emailController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter email address';
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  title: StringsManager.passwordTitle,
                  hintText: StringsManager.passwordHint,
                  keyboardType: TextInputType.visiblePassword,
                  isObscureText: true,
                  controller: passwordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter password';
                    }
                  },
                ),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 56.h,
                ),
                CustomButton(
                  buttonTitle: 'Sign up',
                  onPressed: () {
                    signUp();
                  },
                ),

                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
