import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/presentation/features/faq/presentation/notifier/check_faq_state.dart';

class CheckFaqNotifier extends AutoDisposeNotifier<CheckFaqState> {
  CheckFaqNotifier();
  // late VerificationRepository _verificationRepositoryProvider;
  @override
  CheckFaqState build() {
//  _verificationRepositoryProvider = ref.read(verificationRepositoryProvider);
    return CheckFaqState.initial();
  }

  void changeFaq(String level) {
    state = state.copyWith(
      faqQuestionLevel: level,
    );
  }
}

final checkFaqNotifier =
    NotifierProvider.autoDispose<CheckFaqNotifier, CheckFaqState>(
  CheckFaqNotifier.new,
);
