import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';

class VoiceSmsView extends ConsumerStatefulWidget {
  const VoiceSmsView({super.key});
  static const String routeName = '/voiceSms';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VoiceSmsViewState();
}

class _VoiceSmsViewState extends ConsumerState<VoiceSmsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Voice SMS',
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
