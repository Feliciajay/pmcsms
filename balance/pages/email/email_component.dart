import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailComponent extends ConsumerStatefulWidget {
  const EmailComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailComponentState();
}

class _EmailComponentState extends ConsumerState<EmailComponent> {
  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
