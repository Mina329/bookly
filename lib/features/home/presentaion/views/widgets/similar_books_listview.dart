import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/features/home/presentaion/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 90.h,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (state.books[index].volumeInfo.imageLinks?.thumbnail ==
                      null) {
                    return Container();
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SimilarBooksCubit>(context)
                              .bookModel = state.books[index];
                          BlocProvider.of<SimilarBooksCubit>(context)
                              .fetchSimilarBooks();
                          GoRouter.of(context).push(AppRouter.kBookDetailsView);
                      },
                      child: CustomBookItem(
                        imgUrl:
                            state.books[index].volumeInfo.imageLinks?.thumbnail ?? "" ,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
