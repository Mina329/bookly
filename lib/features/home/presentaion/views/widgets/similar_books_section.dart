
import 'package:bookly/features/home/presentaion/views/widgets/similar_books_listview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "similarBooks",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700),
        ).tr(),
        SizedBox(
          height: 16.h,
        ),
        const SimilarBooksListView(),
        SizedBox(
          height: 40.h,
        )
      ],
    );
  }
}
