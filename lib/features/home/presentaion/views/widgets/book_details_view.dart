import 'package:flutter/material.dart';

import 'book_details_body_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BookDetailsBodyView(),
      ),
    );
  }
}
