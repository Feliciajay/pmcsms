import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/verify_signup_email_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/data/repository/verify_signup_email_otp_repository.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/notifier/verify_otp_state.dart';

class VerifyOtpNotifierNotifier
    extends AutoDisposeNotifier<VerifyOtpNotifierState> {
  VerifyOtpNotifierNotifier();

  late VerifySignupEmailOtpRepository _verifyOtpRepository;

  @override
  VerifyOtpNotifierState build() {
    _verifyOtpRepository = ref.read(verifySignUpEmailOtpRepositoryProvider);

    return VerifyOtpNotifierState.initial();
  }

  Future<void> verifyOtp({
    required VerifySignupEmailOtpRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(verifyOtpState: LoadState.loading);

    try {
      final value = await _verifyOtpRepository.verifySignUpEmailOtp(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(verifyOtpState: LoadState.idle);
      onSuccess("${value.data?.serverMessage}");
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(verifyOtpState: LoadState.idle);
    }
  }
}

final verifyOtpNotifier = NotifierProvider.autoDispose<
    VerifyOtpNotifierNotifier, VerifyOtpNotifierState>(
  VerifyOtpNotifierNotifier.new,
);
