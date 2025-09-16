import 'package:flutter/widgets.dart';
import 'package:pmcsms/presentation/features/buy_unit/presentation/view/buy_unit_view.dart';
import 'package:pmcsms/presentation/features/dashboard/dashboard.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/presentation/view/add_contact_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/contact/presentation/view/add_group_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/components/add_draft_section.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/view/draft_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/email/presentation/view/email_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/scheduled_sms/presentation/view/scheduled_sms_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/sms/presentation/view/sms_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/voice_sms/presentation/view/voice_sms_view.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/whatsapp/presentation/view/whatsapp_view.dart';
import 'package:pmcsms/presentation/features/faq/presentation/faq_view.dart';
import 'package:pmcsms/presentation/features/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/view/bank_transfer_view.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/view/card_fund_view.dart';
import 'package:pmcsms/presentation/features/kyc/presentation/view/kyc_view.dart';
import 'package:pmcsms/presentation/features/login/presentation/view/login_view.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/view/delete_account_view.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/view/manage_account_view.dart';
import 'package:pmcsms/presentation/features/manage_account/presentation/view/profile_view.dart';
import 'package:pmcsms/presentation/features/onboarding/presentation/onboarding_view.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/view/phonebook_view.dart';
import 'package:pmcsms/presentation/features/reset_password/presentation/view/reset_password_success_view.dart';
import 'package:pmcsms/presentation/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/view/sign_up_success_view.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:pmcsms/presentation/features/transaction_pin/presentation/views/set_transaction_pin.dart';
import 'package:pmcsms/presentation/features/transactions/presentation/view/transaction_view.dart';
import 'package:pmcsms/presentation/features/transfer_funds/presentation/view/transfer_funds_view.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/view/verify_email.dart';
import 'package:pmcsms/presentation/general_widgets/splash_screen.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    SignUpView.routeName: (context) => const SignUpView(),
    VerifyEmail.routeName: (context) => const VerifyEmail(),
    SignUpSuccessView.routeName: (context) => const SignUpSuccessView(),
    LoginView.routeName: (context) => const LoginView(),
    ForgotPasswordView.routeName: (context) => const ForgotPasswordView(),
    ResetPasswordView.routeName: (context) => const ResetPasswordView(),
    ResetPasswordSuccessView.routeName: (context) =>
        const ResetPasswordSuccessView(),
    Dashboard.routeName: (context) => const Dashboard(),
    DraftView.routeName: (context) => const DraftView(),
    EmailView.routeName: (context) => const EmailView(),
    ScheduledSmsView.routeName: (context) => const ScheduledSmsView(),
    SmsView.routeName: (context) => const SmsView(),
    VoiceSmsView.routeName: (context) => const VoiceSmsView(),
    WhatsappView.routeName: (context) => const WhatsappView(),
    AddDraftSection.routeName: (context) => const AddDraftSection(),
    CardFundView.routeName: (context) => const CardFundView(),
    BankTransferView.routeName: (context) => const BankTransferView(),
    TransferFundsView.routeName: (context) => const TransferFundsView(),
    AddContactView.routeName: (context) => const AddContactView(),
    ManageAccountView.routeName: (context) => const ManageAccountView(),
    DeleteAccountView.routeName: (context) => const DeleteAccountView(),
    ProfileView.routeName: (context) => const ProfileView(),
    KycView.routeName: (context) => const KycView(),
    FaqView.routeName: (context) => const FaqView(),
    PhonebookView.routeName: (context) => const PhonebookView(),
    AddGroupView.routeName: (context) => const AddGroupView(),
    TransactionView.routeName: (context) => const TransactionView(),
    SetTransactionPin.routeName: (context) => const SetTransactionPin(),
    BuyUnitView.routeName: (context) => const BuyUnitView(),
    // EditGroupView.routeName: (context) => const EditGroupView(),
  };
  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
