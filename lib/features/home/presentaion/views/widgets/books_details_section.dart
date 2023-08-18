import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 30.h,
            left: 75.w,
            right: 75.w,
          ),
          child: const CustomBookItem(
            imgUrl: "https://avatars.githubusercontent.com/u/96777964?v=4",
          ),
        ),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        SizedBox(
          height: 3.h,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 0,
          ratingCount: 0,
        ),
        SizedBox(
          height: 30.h,
        ),
        const BooksAction(),
      ],
    );
  }
}
