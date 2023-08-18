
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,  this.mainAxisAlignment = MainAxisAlignment.start, });
  final MainAxisAlignment mainAxisAlignment;
  
  @override
  Widget build(BuildContext context) {
    final random = Random();
  
  final randomDecimal = (1 + random.nextDouble() * 4).toStringAsFixed(1);
  
  final randomInteger = random.nextInt(3000) + 1;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6.3.w,
        ),
        Text(
          randomDecimal,
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "($randomInteger)",
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}
