import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'featured_listview_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: const FeaturedListViewItem(),
          ),
        ),
      ),
    );
  }
}