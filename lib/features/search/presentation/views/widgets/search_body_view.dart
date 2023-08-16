import 'package:bookly/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentaion/views/widgets/best_seller_item.dart';
import 'custom_search_field.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        SliverToBoxAdapter(
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
        ),
        const SearchResultListView(),
      ],
    );
  }
}
