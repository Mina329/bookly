import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       builder: (context,child)=>
      GetMaterialApp(
      
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor
          ,textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme), 
        ),
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: SplashScreen()),
      ),
    );
  }
}
