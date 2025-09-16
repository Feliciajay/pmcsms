import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pmcsms/core/extensions/build_context_extension.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/widgets/side_bar_widget.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/general_widgets/log_out_widget.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.userName, required this.email});
  final String userName;
  final String email;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: MediaQuery.of(context).size.width * .85,
      elevation: 0,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 43),
          children: [
            SizedBox(
              height: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/user_avatar.png'),
                  ),
                  const VerticalSpacing(16),
                  Text(
                    widget.userName,
                    style: context.textTheme.s16w600.copyWith(
                      color: AppColors.primary0C0C0C,
                    ),
                  ),
                  const VerticalSpacing(4),
                  Text(
                    widget.email,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary676767,
                    ),
                  ),
                ],
              ),
            ),
            const SideBarWidget(
              icon: 'assets/icons/profile.svg',
              title: 'Your Profile',
            ),
            const SideBarWidget(
              icon: 'assets/icons/user_id.svg',
              title: 'User ID',
            ),
            const SideBarWidget(
              icon: 'assets/icons/history.svg',
              title: 'Messaging History',
            ),
            const SideBarWidget(
              icon: 'assets/icons/analytics.svg',
              title: 'Analytics',
            ),
            const SideBarWidget(
              icon: 'assets/icons/message.svg',
              title: 'Send a message',
            ),
            const SideBarWidget(
              icon: 'assets/icons/referrals.svg',
              title: 'Referrals',
            ),
            const VerticalSpacing(50),
            const Divider(
              color: AppColors.primaryE8E8E8,
            ),
            const SideBarWidget(
              icon: 'assets/icons/support.svg',
              title: 'Contact support',
            ),
            SideBarWidget(
              icon: 'assets/icons/logout.svg',
              title: 'Log out',
              isLoggout: true,
              onTap: () => logoutAlertMethod(context),
            ),
          ].animate(interval: .300.microseconds).slideX(),
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
