import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/more/component/more_option_section.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/log_out_widget.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class MoreView extends ConsumerStatefulWidget {
  const MoreView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoreViewState();
}

class _MoreViewState extends ConsumerState<MoreView> {
  String userName = '';
  String email = '';
  String fullName = '';

  @override
  void initState() {
    getUserNameEmail();
    super.initState();
  }

  getUserNameEmail() async {
    final userNameStorage = await SecureStorage().getUserFirstName();
    final emailStorage = await SecureStorage().getUserEmail();
    final fullNameStorage = await SecureStorage().getUserFullName();
    setState(() {
      userName = userNameStorage.toString();
      email = emailStorage.toString();
      fullName = fullNameStorage.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const SizedBox.shrink(),
        title: 'More',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                logoutAlertMethod(context);
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  const HorizontalSpacing(5),
                  Text(
                    'Log out',
                    style: context.textTheme.s14w400.copyWith(
                      color: AppColors.primaryEB5757,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryDAE7FF,
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/user_avatar.png'),
                      ),
                    ),
                  ),
                  const VerticalSpacing(12),
                  Text(
                    fullName,
                    style: context.textTheme.s16w600.copyWith(
                      color: AppColors.primary191919,
                    ),
                  ),
                  const VerticalSpacing(2),
                  Text(
                    userName,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary676767,
                    ),
                  ),
                  const VerticalSpacing(20),
                  const MoreOptionSection()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> logoutAlertMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: LogoutWidget(
              onTap: () {
                _signOut();
              },
            )));
  }

  void _signOut() async {
    await SecureStorage().clearApiKey();
    // ignore: use_build_context_synchronously
    context.pushReplacementNamed(LoginView.routeName);
  }
}
