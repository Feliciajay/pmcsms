import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/overlay_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/widget/delete_account_dialog.dart';
import 'package:pmcsms/presentation/general_widgets/app_send_button.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class DeleteAccountView extends ConsumerStatefulWidget {
  const DeleteAccountView({super.key});
  static const String routeName = '/deleteAccount';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeleteAccountViewState();
}

class _DeleteAccountViewState extends ConsumerState<DeleteAccountView> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Delete Account',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacing(49),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryFFF2F2,
                  ),
                  child: SvgPicture.asset('assets/icons/delete_account.svg'),
                ),
              ),
              const VerticalSpacing(20),
              Text(
                'You are about to delete your account, this action will erase all your data from our database permanently',
                style: context.textTheme.s14w400.copyWith(
                  color: AppColors.primary676767,
                ),
              ),
              const VerticalSpacing(20),
              Text(
                'Let us know the reason you are leaving',
                style: context.textTheme.s16w500.copyWith(
                  color: AppColors.primary1A1A1A,
                ),
              ),
              const VerticalSpacing(20),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: deleteAccountReasons.length,
                    itemBuilder: (_, index) {
                      final data = deleteAccountReasons[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data,
                                  style: context.textTheme.s14w400.copyWith(
                                    color: AppColors.primary333333,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primary979797,
                                      )),
                                  child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _selectedIndex == index
                                            ? AppColors.primary1C1C1C
                                            : AppColors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const VerticalSpacing(24),
                        ],
                      );
                    }),
              ),
              if (_selectedIndex == 3)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tell us more about your reason (optional)',
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary475569,
                      ),
                    ),
                    const VerticalSpacing(8),
                    Container(
                      height: 150.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppColors.white,
                          border: Border.all(
                            color:
                                AppColors.primaryCBD5E1.withValues(alpha: 0.36),
                          )),
                      child: const TextField(
                        maxLines: 10,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              const VerticalSpacing(71),
              AppSendButton(
                  backgroundColor: AppColors.primaryEB5757,
                  onTap: () {
                    if (_selectedIndex == null) {
                      context.showError(message: 'Pls select a reason');
                    } else {
                      _deleteAccountAlertMethod(context);
                    }
                  },
                  title: 'Save changes')
            ],
          ),
        ),
      )),
    );
  }
}

Future<dynamic> _deleteAccountAlertMethod(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: DeleteAccountDialog(
            onTap: () {
              //  _signOut();
            },
          )));
}

final List<String> deleteAccountReasons = [
  'I\'ve not had a good app experience',
  'I want to start afresh',
  'Just wanted to check the app out',
  'Others'
];
