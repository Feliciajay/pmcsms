import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/view/delete_account_view.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/view/profile_view.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class ManageAccountView extends StatefulWidget {
  const ManageAccountView({super.key});
  static const String routeName = '/manageAccount';

  @override
  State<ManageAccountView> createState() => _ManageAccountViewState();
}

class _ManageAccountViewState extends State<ManageAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Manage Account',
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: manageAccountOptions.length,
                    itemBuilder: (_, index) {
                      final data = manageAccountOptions[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => _onTap(index),
                            child: Container(
                              height: 58.h,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.primaryF5F7F9,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(data['icon']),
                                      const HorizontalSpacing(12),
                                      Text(data['option'])
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/arrow_right.svg'),
                                ],
                              ),
                            ),
                          ),
                          const VerticalSpacing(20)
                        ],
                      );
                    }),
              )
            ],
          ),
        )));
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.pushNamed(ProfileView.routeName);
      case 1:
        context.pushNamed(DeleteAccountView.routeName);
      default:
    }
  }
}

final List<Map<String, dynamic>> manageAccountOptions = [
  {"icon": "assets/icons/edit.svg", "option": "Your profile"},
  {"icon": "assets/icons/delete_dark.svg", "option": "Delete account"},
];
