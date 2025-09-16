import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/components/initiate_transfer_funds_section.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/notifier/transfer_funds_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';

class InitiateFundsTransferView extends ConsumerStatefulWidget {
  const InitiateFundsTransferView({required this.email, super.key});
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InitiateFundsTransferViewState();
}

class _InitiateFundsTransferViewState
    extends ConsumerState<InitiateFundsTransferView> {
  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(transferFundsNotifier.select((v) => v.state.isLoading));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Transfer Funds',
      ),
      body: PageLoader(
        isLoading: isLoading,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              InitiateTransferFundsSection(
                email: widget.email,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
