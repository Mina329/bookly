
import 'package:bookly/features/home/presentaion/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).similarBooks,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700),
        ),
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
