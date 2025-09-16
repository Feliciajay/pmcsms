import 'package:flutter/material.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBox(
          flex: 6,
          widthFactor: 1,
        )
      ],
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key, required this.flex, required this.widthFactor});

  final int flex;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: FractionallySizedBox(
          widthFactor: widthFactor,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}
