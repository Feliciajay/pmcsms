import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/core/utils/date_picker.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/widget/profile_widget.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';
import 'package:pmcsms/utils/date_format.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  String dob = '';
  String email = '';
  String fullName = '';
  String firstName = '';
  String lastName = '';

  @override
  void initState() {
    getUserNameEmail();
    super.initState();
  }

  getUserNameEmail() async {
    final loginResponse = await SecureStorage().getLoginResponse();

    final fullNameStorage = await SecureStorage().getUserFullName();
    setState(() {
      email = loginResponse?.data?.userSettings?.email ?? '';
      fullName = fullNameStorage.toString();
      firstName = loginResponse?.data?.userSettings?.firstname ?? '';
      lastName = loginResponse?.data?.userSettings?.lastname ?? '';
      dob = loginResponse?.data?.userSettings?.dob ?? '';
    });
  }

  DateTime? _selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await DatePickerUtils.selectDate(
        context: context, initialDate: _selectedDate, lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void formatDate(DateTime selectedDate) {
    DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Your Profile',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const VerticalSpacing(39),
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
            ),
            const VerticalSpacing(12),
            Container(
              width: MediaQuery.of(context).size.width * 0.43,
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  color: AppColors.primaryECF1F8,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/edit.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const HorizontalSpacing(5),
                  Text(
                    'Change picture',
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const VerticalSpacing(32),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 17,
              ),
              decoration: BoxDecoration(
                  color: AppColors.primaryF5F7F9,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ProfileWidget(
                    title: 'First Name',
                    value: firstName,
                  ),
                  const VerticalSpacing(15),
                  const Divider(
                    color: AppColors.primaryE8E8E8,
                  ),
                  const VerticalSpacing(15),
                  ProfileWidget(
                    title: 'Last Name',
                    value: lastName,
                  ),
                  const Divider(
                    color: AppColors.primaryE8E8E8,
                  ),
                  const VerticalSpacing(15),
                  ProfileWidget(
                    title: 'Email',
                    value: email,
                    canEdit: false,
                  ),
                  const VerticalSpacing(15),
                  const Divider(
                    color: AppColors.primaryE8E8E8,
                  ),
                  const VerticalSpacing(15),
                  ProfileWidget(
                    onTap: () => _selectDate(),
                    title: 'Birthday',
                    value: formatFullDate('${_selectedDate ?? dob}'),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
