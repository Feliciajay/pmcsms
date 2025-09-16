import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletComponent extends ConsumerStatefulWidget {
  const WalletComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletComponentState();
}

class _WalletComponentState extends ConsumerState<WalletComponent> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
