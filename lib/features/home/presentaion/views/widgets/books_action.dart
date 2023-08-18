import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: const Row(
        children: [
          Expanded(
            child: CustomButton(
               text: "Free",
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              text: "Free preview",
              backgroundColor: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              fontSize: 16,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
