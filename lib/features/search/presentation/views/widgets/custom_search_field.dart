import 'package:bookly/features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Icon getBackArrowIcon() {
      if (context.locale.languageCode == "ar") {
        return const Icon(
          FontAwesomeIcons.arrowRight,
          size: 22,
        );
      }
      return const Icon(
        FontAwesomeIcons.arrowLeft,
        size: 22,
      );
    }

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        enabledBorder: _buildOutlinedInputBorder(),
        focusedBorder: _buildOutlinedInputBorder(),
        hintText: 'search'.tr(),
        prefixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Opacity(
            opacity: 0.8,
            child: getBackArrowIcon(),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchBooksCubit>(context).searchText =
                _controller.text;
            BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
      onSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context).searchText =
            _controller.text;
        BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks();
      },
    );
  }

  OutlineInputBorder _buildOutlinedInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
