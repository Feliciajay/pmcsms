import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';

class WhatsappView extends ConsumerStatefulWidget {
  const WhatsappView({super.key});
  static const String routeName = '/whatsapp';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WhatsappViewState();
}

class _WhatsappViewState extends ConsumerState<WhatsappView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Whatsapp',
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
