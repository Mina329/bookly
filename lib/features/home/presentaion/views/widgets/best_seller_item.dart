import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://avatars.githubusercontent.com/u/96777964?v=4"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Harry Potter and the Goblet of Fire",
                      style:
                          Styles.textStyle20.copyWith(fontFamily: kGTSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "J.K. Rowling",
                    style: Styles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("19.99 €", style: Styles.textStyle20),
                      const BookRating(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
