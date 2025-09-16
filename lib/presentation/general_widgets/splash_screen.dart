// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/dashboard/dashboard.dart';
import 'package:pmcsms/presentation/features/onboarding/presentation/onboarding_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // sendToken();
    });
    Future.delayed(const Duration(seconds: 3), () async {
      final apiKey = await secureStorage.getUserApiKey();
      //  log('This is accesstoken $accessToken');

      if (apiKey != null) {
        context.pushReplacementNamed(Dashboard.routeName);
      } else {
        context.pushReplacementNamed(OnboardingView.routeName);
      }
    });
  }

  // sendToken() async {
  //   await ref.read(sendTokenNotifier.notifier).sendToken();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/logo/pmcsms_logo.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
