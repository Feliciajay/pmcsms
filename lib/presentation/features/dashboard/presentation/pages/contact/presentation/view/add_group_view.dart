import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/create_group_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/app_form_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AddGroupView extends ConsumerStatefulWidget {
  const AddGroupView({super.key});
  static const String routeName = '/addGroupView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupViewState();
}

class _AddGroupViewState extends ConsumerState<AddGroupView> {
  final ValueNotifier<bool> _isInputEnabled = ValueNotifier(false);

  late TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController()..addListener(_validateInput);

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  void _validateInput() {
    _isInputEnabled.value = _nameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.read(createGroupNotifier.select((v) => v.state.isLoading));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add New Group',
        centerTitle: true,
      ),
      body: PageLoader(
        isLoading: isLoading,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppFormField(
                label: 'Name',
                controller: _nameController,
              ),
              const VerticalSpacing(40),
              ValueListenableBuilder(
                  valueListenable: _isInputEnabled,
                  builder: (context, re, c) {
                    return AppSendButton(
                        isEnabled: re,
                        onTap: () {
                          _createGroup();
                        },
                        title: 'Create group');
                  })
            ],
          ),
        )),
      ),
    );
  }

  void _createGroup() {
    final data = CreateGroupRequest(
      action: 'add_group',
      process: 'pm_groups',
      groupName: _nameController.text.trim(),
    );

    ref.read(createGroupNotifier.notifier).createGroup(
        data: data,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: message);
        });
  }
}
