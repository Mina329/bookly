import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentaion/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentaion/views/widgets/featured_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'best_seller_listview.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedListView(),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  bottom: 20.h,
                ),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        const BestSellerListView(),
      ],
    ));
  }
}

