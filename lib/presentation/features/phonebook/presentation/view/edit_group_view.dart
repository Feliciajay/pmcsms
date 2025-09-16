import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/presentation/general_widgets/app_form_field.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class EditGroupView extends ConsumerStatefulWidget {
  const EditGroupView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditGroupViewState();
}

class _EditGroupViewState extends ConsumerState<EditGroupView> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Group',
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppFormField(
              label: 'Name',
              controller: _nameController,
            ),
            const VerticalSpacing(40),
          ],
        ),
      )),
    );
  }
}
