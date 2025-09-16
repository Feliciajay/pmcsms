import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';

class SmsView extends ConsumerStatefulWidget {
  const SmsView({super.key});
  static const String routeName = '/sms';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SmsViewState();
}

class _SmsViewState extends ConsumerState<SmsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SMS',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/icons/clock.svg'),
          ),
        ],
      ),
      body: const SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
