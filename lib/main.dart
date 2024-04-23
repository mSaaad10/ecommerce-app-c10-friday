import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/home_screen.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view.dart';
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
        home: HomeScreen(),
      ),
    );
  }
}