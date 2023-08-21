import 'package:bookly/core/l10n/generated/l10n.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentaion/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentaion/views/widgets/featured_listview.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:restart_app/restart_app.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/cache/cache_keys_values.dart';
import 'newest_book_listview.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);

    return Scaffold(
        floatingActionButton: SpeedDial(
          openCloseDial: isDialOpen,
          spacing: 15,
          renderOverlay: false,
          backgroundColor: const Color.fromARGB(255, 36, 16, 104),
          children: [
            SpeedDialChild(
              child: CircleFlag('eg'),
              onTap: () async {
                if (CacheData.getData(key: CacheKeys.kLANGUAGE) !=
                    CacheValues.ARABIC) {
                  await CacheData.setData(
                      key: CacheKeys.kLANGUAGE, value: CacheValues.ARABIC);
                  Restart.restartApp();
                }
              },
            ),
            SpeedDialChild(
              child: CircleFlag('gb'),
              onTap: () async {
                if (CacheData.getData(key: CacheKeys.kLANGUAGE) !=
                    CacheValues.ENGLISH) {
                  await CacheData.setData(
                      key: CacheKeys.kLANGUAGE, value: CacheValues.ENGLISH);
                  Restart.restartApp();
                }
              },
            )
          ],
          child: const Icon(
            Icons.language,
            color: Colors.blueGrey,
          ),
        ),
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
                      S.of(context).newestBooks,
                      style: Styles.textStyle18,
                    ),
                  ),
                ],
              ),
            ),
            const NewestBookListView(),
          ],
        ));
  }
}
