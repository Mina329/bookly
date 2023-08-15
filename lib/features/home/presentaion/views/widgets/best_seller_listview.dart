import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: const BestSellerItem(),
        ),
        childCount: 10,
      ),
    );
  }
}