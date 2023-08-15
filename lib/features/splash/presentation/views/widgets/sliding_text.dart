
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_){
        return SlideTransition(
        position: slidingAnimation,
        child:  Text(
          "Read Free Books",
          style: TextStyle(fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
      );
      },
    );
  }
}
