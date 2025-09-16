import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';

class EmailView extends ConsumerStatefulWidget {
  const EmailView({super.key});
  static const String routeName = '/emailView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailViewState();
}

class _EmailViewState extends ConsumerState<EmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Email',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/icons/clock.svg'),
          ),
        ],
      ),
    );
  }
}
