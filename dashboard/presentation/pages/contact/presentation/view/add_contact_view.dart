import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/components/add_new_contact_component.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/components/upload_contact_image.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/add_to_phonebook_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/page_loader.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class AddContactView extends ConsumerStatefulWidget {
  const AddContactView({super.key});
  static const String routeName = '/addContact';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddContactViewState();
}

class _AddContactViewState extends ConsumerState<AddContactView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(addToPhonebookNotifier.select((v) => v.loadState.isLoading));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Contact',
      ),
      body: PageLoader(
        isLoading: isLoading,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 33),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _addContactType.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? AppColors.primary1C1C1C
                                  : AppColors.primaryF8F6F6,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _addContactType[index],
                              style: context.textTheme.s12w400.copyWith(
                                color: _selectedIndex == index
                                    ? AppColors.primaryE6E6E6
                                    : AppColors.primary1C1C1C,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const VerticalSpacing(17),
                _selectedIndex == 0
                    ? const AddNewContactComponent()
                    : const UploadContactImage()
              ],
            ),
          ),
        )),
      ),
    );
  }
}

final List<String> _addContactType = [
  'New Contact',
  'Upload',
];
