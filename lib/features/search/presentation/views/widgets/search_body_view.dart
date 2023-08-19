import 'package:bookly/core/utils/custom_error_widget.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/view_model/search_books_cubit/seach_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentaion/views/widgets/best_seller_item.dart';
import 'custom_search_field.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(
        getIt.get<SearchRepoImpl>(),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 20.h,
              ),
              child: const CustomSearchField(),
            ),
          ),
          BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              if (state is SearchBooksInitial ||
                  state is SearchBooksLoading ||
                  state is SearchBooksFailure) {
                return SliverToBoxAdapter(child: Container());
              } else {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      bottom: 20.h,
                    ),
                    child: Text(
                      "Search Result",
                      style: Styles.textStyle18,
                    ),
                  ),
                );
              }
            },
          ),
          BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              if (state is SearchBooksLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is SearchBooksFailure) {
                return SliverFillRemaining(
                  child: Center(
                    child: CustomErrorWidget(
                      errorMessage: state.errMessage,
                    ),
                  ),
                );
              } else if (state is SearchBooksSuccess) {
                return SearchResultListView(
                  books: state.books,
                );
              } else {
                return SliverFillRemaining(
                  child: Center(
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Please, Type What are you searching for.",
                        style: Styles.textStyle14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
