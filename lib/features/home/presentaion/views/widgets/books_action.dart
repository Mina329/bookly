import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    Widget getfreeCustomButtom() {
      if (context.locale.languageCode == "ar") {
        return CustomButton(
          text: "free".tr(),
          backgroundColor: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          textColor: Colors.black,
        );
      }
      return CustomButton(
        text: "free".tr(),
        backgroundColor: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        textColor: Colors.black,
      );
    }

    Widget getpreviewCustomButtom() {
      if (context.locale.languageCode == "ar") {
        return CustomButton(
          onPressed: () async {
            final Uri url = Uri.parse(bookModel.volumeInfo.previewLink ?? "");

            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("Something went wrong. Please, Try again later."),
                  ),
                );
              }
            }
          },
          text: "preview".tr(),
          backgroundColor: const Color(0xffEF8262),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          fontSize: 16,
          textColor: Colors.white,
        );
      }
      return CustomButton(
        onPressed: () async {
          final Uri url = Uri.parse(bookModel.volumeInfo.previewLink ?? "");

          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text("Something went wrong. Please, Try again later."),
                ),
              );
            }
          }
        },
        text: "preview".tr(),
        backgroundColor: const Color(0xffEF8262),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        fontSize: 16,
        textColor: Colors.white,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: getfreeCustomButtom(),
          ),
          Expanded(
            child: getpreviewCustomButtom(),
          ),
        ],
      ),
    );
  }
}
