import 'package:bookly/features/home/presentaion/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_item.dart';

class BooksDetailsSection extends StatefulWidget {
  const BooksDetailsSection({super.key});

  @override
  State<BooksDetailsSection> createState() => _BooksDetailsSectionState();
}

class _BooksDetailsSectionState extends State<BooksDetailsSection> {
  late BookModel bookModel ;
@override
  void initState() {
    super.initState();
    bookModel = BlocProvider.of<SimilarBooksCubit>(context).bookModel;
  }
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
          child:  CustomBookItem(
            imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
          ),
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 3.h,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? "",
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
        ),
        SizedBox(
          height: 30.h,
        ),
        const BooksAction(),
      ],
    );
  }
}
