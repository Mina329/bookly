import 'package:bookly/features/search/presentation/views/widgets/search_body_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SearchBodyView(),
    ));
  }
}
