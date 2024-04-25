import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/home_screen.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/signin_user/signin_screen.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/signup_user/signup_screen.dart';
import 'package:ecommerce_app_c10_frida/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme:  ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: Colors.white,

            )
          )
        ),
        routes: {
          RoutesManager.signUpRouteName:(context) => SignUpScreen(),
          RoutesManager.signInRouteName : (context) => SignInScreen(),
          RoutesManager.homeRouteName : (context) => HomeScreen(),
        },
        initialRoute: RoutesManager.signInRouteName,
      ),
    );
  }
}