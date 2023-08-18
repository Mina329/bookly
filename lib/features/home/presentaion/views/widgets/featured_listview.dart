import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/home/presentaion/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../view_model/similar_books_cubit/similar_books_cubit.dart';
import 'custom_book_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 200.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                  itemCount: state.books.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<SimilarBooksCubit>(context)
                              .bookModel = state.books[index];
                          BlocProvider.of<SimilarBooksCubit>(context)
                              .fetchSimilarBooks();
                          GoRouter.of(context).push(AppRouter.kBookDetailsView);
                        },
                        child: CustomBookItem(
                          imgUrl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              "",
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
