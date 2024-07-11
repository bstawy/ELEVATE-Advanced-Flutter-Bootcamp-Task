import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/theme/text_styles.dart';
import '../../manager/products_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _searchController;
  Timer? _debounceTimer;
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  // debounce search query to avoid multiple requests
  // send search request only when user stop typing
  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty && query != lastQuery) {
        lastQuery = query;
        context.read<ProductsCubit>().search(query);
      }
      if (_searchController.text.isEmpty) {
        context.read<ProductsCubit>().clearSearch();
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      onChanged: (value) => _onSearchQueryChanged(value),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: "What do you search for?",
        hintStyle: TextStyles.font14LightBlueLight,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 8.w,
          ),
          child: SvgPicture.asset(
            'assets/icons/search_icon.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
        ),
      ),
    );
  }
}
