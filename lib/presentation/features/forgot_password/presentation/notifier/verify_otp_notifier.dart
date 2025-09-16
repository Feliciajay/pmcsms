import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/verify_otp_request.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/repository/verify_otp_repository.dart';
import 'package:pmcsms/presentation/features/verify_email/presentation/notifier/verify_otp_state.dart';

class VerifyOtpNotifier extends AutoDisposeNotifier<VerifyOtpNotifierState> {
  VerifyOtpNotifier();

  late VerifyOtpRepository _verifyOtpRepository;

  @override
  VerifyOtpNotifierState build() {
    _verifyOtpRepository = ref.read(verifyOtpRepositoryProvider);

    return VerifyOtpNotifierState.initial();
  }

  Future<void> verifyOtp({
    required VerifyOtpRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(verifyOtpState: LoadState.loading);

    try {
      final value = await _verifyOtpRepository.verifyOtp(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage!;

      state = state.copyWith(verifyOtpState: LoadState.idle);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(verifyOtpState: LoadState.idle);
    }
  }
}

final verifyOtpNotifier =
    NotifierProvider.autoDispose<VerifyOtpNotifier, VerifyOtpNotifierState>(
  VerifyOtpNotifier.new,
);
