import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/utils.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/presentation/view/add_contact_view.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_contact_request.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/delete_contact_notifier.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/get_all_phone_book_notifier.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/view/edit_contact_view.dart';
import 'package:pmcsms/presentation/general_widgets/custom_search_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class ContactComponent extends ConsumerStatefulWidget {
  const ContactComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactComponentState();
}

class _ContactComponentState extends ConsumerState<ContactComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllContactsNotifier.notifier).getAllContacts();
    });
    super.initState();
  }

  final _searchController = TextEditingController();

  void _contactSearch(String query) {
    ref.read(searchQueryProvider.notifier).state = query;
  }

  @override
  Widget build(BuildContext context) {
    final contactsList =
        ref.watch(getAllContactsNotifier.select((v) => v.data?.data ?? []));

    final searchQuery = ref.watch(searchQueryProvider);
    final filteredList = contactsList.where((contact) {
      final matchSearch =
          contact.ownerName!.toLowerCase().contains(searchQuery.toLowerCase());

      return matchSearch;
    }).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      child: Stack(
        children: [
          Column(
            children: [
              CustomSearchBar(
                controller: _searchController,
                onChanged: _contactSearch,
              ),
              const VerticalSpacing(17),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryF5F7F9,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${contactsList.length} Contacts',
                            style: context.textTheme.s14w400.copyWith(
                              color: AppColors.primary1C1C1C,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/download.svg'),
                              const HorizontalSpacing(12),
                              SvgPicture.asset('assets/icons/more_rounded.svg'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.primaryE8E8E8,
                    ),
                    const VerticalSpacing(20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.47,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: filteredList.length,
                          itemBuilder: (_, index) {
                            final contact = filteredList[index];
                            final initials =
                                getInitials(contact.ownerName ?? '');
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              AppColors.primaryF1BD6C,
                                          child: Text(initials,
                                              style: context.textTheme.s14w600
                                                  .copyWith(
                                                color: AppColors.black,
                                              )),
                                        ),
                                        const HorizontalSpacing(15),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              contact.ownerName ?? '',
                                              style: context.textTheme.s14w500
                                                  .copyWith(
                                                color: AppColors.primary1C1C1C,
                                              ),
                                            ),
                                            const VerticalSpacing(3),
                                            Text(
                                              contact.addressBook ?? '',
                                              style: context.textTheme.s12w400
                                                  .copyWith(
                                                color: AppColors.primary676767,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    PopupMenuButton(
                                        borderRadius: BorderRadius.circular(8),
                                        elevation: 0.5,
                                        padding: EdgeInsets.zero,
                                        color: AppColors.white,
                                        icon: const Icon(Icons.more_vert),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/edit.svg'),
                                                  const HorizontalSpacing(8),
                                                  Text(
                                                    'Edit Contact',
                                                    style: context
                                                        .textTheme.s14w500
                                                        .copyWith(
                                                      color: AppColors
                                                          .primary1C1C1C,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (_) {
                                                      return const EditContactView();
                                                    });
                                              },
                                            ),
                                            PopupMenuItem(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.add),
                                                  const HorizontalSpacing(8),
                                                  Text(
                                                    'Add to group',
                                                    style: context
                                                        .textTheme.s14w500
                                                        .copyWith(
                                                      color: AppColors
                                                          .primary1C1C1C,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                _deleteContact(
                                                    contact.addressId!);
                                              },
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/delete.svg'),
                                                  const HorizontalSpacing(8),
                                                  Text(
                                                    'Delete contact',
                                                    style: context
                                                        .textTheme.s14w500
                                                        .copyWith(
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ];
                                        })
                                  ],
                                ),
                                const VerticalSpacing(10),
                                const Divider(
                                  color: AppColors.primaryE8E8E8,
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: GestureDetector(
              onTap: () => context.pushNamed(AddContactView.routeName),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _deleteContact(int addressBookId) {
    final data = DeleteContactRequest(
      addressBookId: addressBookId,
      process: 'pm_address_books',
      action: 'delete_address_book',
    );

    ref.read(deleteContactNotifier.notifier).deleteContact(
        data: data,
        onError: (error) {
          context.showError(message: error);
        },
        onSuccess: (message) {
          context.showSuccess(message: message);
          ref.read(getAllContactsNotifier.notifier).getAllContacts();
        });
  }
}
