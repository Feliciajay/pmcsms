import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/presentation/features/balance/balance_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/presentation/view/contact_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/home_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/presentation/view/messaging_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/more/presentation/view/more_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/widgets/bottom_nav.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(currentIndexProvider),
        children: const [
          HomeView(),
          MessagesView(),
          BalanceView(),
          ContactView(),
          MoreView(),
        ],
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
