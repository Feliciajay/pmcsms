import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/view/side_bar.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/complete_setup_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/widgets/dashboard_appbar.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/quick_action_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/recent_transaction_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/transfer_funds_wallet_buttons.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/home/widgets/wallet_balance_section.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_request.dart';
import 'package:pmcsms/presentation/features/transactions/presentation/notifier/get_wallet_history_notifier.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  static const String routeName = '/dashboard';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<HomeView> {
  String userName = '';
  String email = '';
  final data = WalletHistoryRequest(
    process: 'pm_wallet',
    action: 'wallet_history',
  );

  @override
  void initState() {
    getUserNameEmail();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getWalletHistoryNotifier.notifier)
          .getWalletHistory(data: data);
    });
    super.initState();
  }

  getUserNameEmail() async {
    final userNameStorage = await SecureStorage().getUserFirstName();
    final emailStorage = await SecureStorage().getUserEmail();
    setState(() {
      userName = userNameStorage.toString();
      email = emailStorage.toString();
    });
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    final walletList = ref.watch(
        getWalletHistoryNotifier.select((v) => v.data?.data?.history ?? []));
    final greetingMessage = getGreetingMessage();

    return Scaffold(
      appBar: DashboardAppbar(
        greeting: greetingMessage,
        userName: userName,
      ),
      drawer: SideBar(
        userName: userName,
        email: '',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CompleteSetupSection(),
              const VerticalSpacing(24),
              const WalletBalanceSection(),
              const VerticalSpacing(20),
              const TransferFundsWalletButtons(),
              const VerticalSpacing(40),
              const QuickActionSection(),
              const VerticalSpacing(40),
              RecentTransactionSection(
                walletList: walletList,
              ),
              const VerticalSpacing(30),
            ],
          ),
        ),
      )),
    );
  }
}
