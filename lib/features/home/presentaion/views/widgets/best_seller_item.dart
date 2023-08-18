import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView),
      child: SizedBox(
        height: 90.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              CustomBookItem(imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ""),
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
                        bookModel.volumeInfo.title ?? "",
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGTSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      bookModel.volumeInfo.authors?[0] ?? "" ,
                      style: Styles.textStyle14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free", style: Styles.textStyle20),
                        const BookRating(rating:0,ratingCount: 0),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
