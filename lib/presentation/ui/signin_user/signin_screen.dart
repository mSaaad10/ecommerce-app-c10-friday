import 'package:ecommerce_app_c10_frida/core/strings_manager.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_button.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_c10_frida/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //var userNameController = TextEditingController();

  //var passwordController = TextEditingController();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                Text(
                  StringsManager.welcomeMessage,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  StringsManager.pleaseSignIn,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  title: StringsManager.emailTitle,
                  hintText: StringsManager.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter email';
                    }
                    if (!(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(input))) {
                      return 'Please enter a valid email';
                    }
                  },
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
                SizedBox(
                  height: 40.h,
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
                  buttonTitle: 'Login',
                  onPressed: () {
                    login();
                  },
                ),
                SizedBox(height: 32.h),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesManager.signUpRouteName);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
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

  void login() {
    if(formKey.currentState?.validate() == false){
      return;
    }
    // Now you can log-in
  }
}
