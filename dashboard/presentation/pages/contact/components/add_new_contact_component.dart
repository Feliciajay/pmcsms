import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/add_to_phonebook_request.dart';

import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/add_to_phonebook_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/amount_textfield.dart';
import 'package:pmcsms/presentation/general_widgets/app_form_field.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AddNewContactComponent extends ConsumerStatefulWidget {
  const AddNewContactComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewContactComponentState();
}

class _AddNewContactComponentState
    extends ConsumerState<AddNewContactComponent> {
  final ValueNotifier<bool> _isInputEnabled = ValueNotifier(false);

  late TextEditingController _phoneController;

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  @override
  void initState() {
    _phoneController = TextEditingController()..addListener(_validateInput);

    _firstNameController = TextEditingController()..addListener(_validateInput);
    _lastNameController = TextEditingController()..addListener(_validateInput);
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _validateInput() {
    _isInputEnabled.value = _phoneController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFormField(
          label: 'First name',
          controller: _firstNameController,
        ),
        const VerticalSpacing(24),
        AppFormField(
          label: 'Last name',
          controller: _lastNameController,
        ),
        const VerticalSpacing(24),
        Text(
          'Phone number',
          style: context.textTheme.s14w400
              .copyWith(color: AppColors.primary0F0F0F),
        ),
        const VerticalSpacing(8),
        AmountTextField(
          amountController: _phoneController,
          hintText: '',
          maxLength: 11,
        ),
        const VerticalSpacing(40),
        ValueListenableBuilder(
            valueListenable: _isInputEnabled,
            builder: (context, re, c) {
              return AppSendButton(
                  isEnabled: re,
                  onTap: () {
                    _addContactToPhoneBook();
                  },
                  title: 'Add Contact');
            })
      ],
    );
  }

  void _addContactToPhoneBook() {
    final data = AddToPhoneBookRequest(
        action: 'add_address_book',
        process: 'pm_address_books',
        addressBook: _phoneController.text.trim(),
        ownerName:
            '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}');

    ref.read(addToPhonebookNotifier.notifier).addToPhonebook(
        data: data,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: message);
        });
  }
}
