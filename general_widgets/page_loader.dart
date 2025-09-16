import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pmcsms/core/theme/app_colors.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({super.key, required this.child, required this.isLoading});
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        color: AppColors.primaryColor.withValues(alpha: 0.5),
        progressIndicator: const _AppLoader(),
        isLoading: isLoading,
        child: PopScope(canPop: !isLoading, child: child));
  }
}

class _AppLoader extends StatelessWidget {
  const _AppLoader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.flickr(
        leftDotColor: AppColors.primaryColor,
        rightDotColor: Colors.blue,
        size: 50,
      ),
    );
  }
}
