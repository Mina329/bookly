import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/home/presentaion/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: BestSellerItem(
                  bookModel: state.books[index],
                ),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  CustomErrorWidget(errorMessage: state.errMessage),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding:  EdgeInsets.symmetric(vertical: 50.h),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
