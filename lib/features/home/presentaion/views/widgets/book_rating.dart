
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,  this.mainAxisAlignment = MainAxisAlignment.start, required this.rating, required this.ratingCount});
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int ratingCount; 
  @override
  Widget build(BuildContext context) {
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
          "$rating",
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "($ratingCount)",
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}
