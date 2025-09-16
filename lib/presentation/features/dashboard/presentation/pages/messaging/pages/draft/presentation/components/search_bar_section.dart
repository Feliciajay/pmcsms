import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryF5F7F9,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: context.textTheme.s12w500.copyWith(
            color: AppColors.primary8A93A3,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
