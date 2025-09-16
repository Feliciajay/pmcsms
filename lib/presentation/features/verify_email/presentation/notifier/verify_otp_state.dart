import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/verify_signup_email_otp_response.dart';

class VerifyOtpNotifierState {
  VerifyOtpNotifierState({
    required this.inputValid,
    required this.verifyOtpState,
    required this.verifyOtpResponse,
  });
  factory VerifyOtpNotifierState.initial() {
    return VerifyOtpNotifierState(
      inputValid: false,
      verifyOtpState: LoadState.idle,
      verifyOtpResponse: null,
    );
  }
  final bool inputValid;
  final LoadState verifyOtpState;
  final VerifySignupEmailOtpReponse? verifyOtpResponse;
  VerifyOtpNotifierState copyWith({
    bool? inputValid,
    LoadState? verifyOtpState,
    VerifySignupEmailOtpReponse? verifyOtpResponse,
  }) {
    return VerifyOtpNotifierState(
      inputValid: inputValid ?? this.inputValid,
      verifyOtpState: verifyOtpState ?? this.verifyOtpState,
      verifyOtpResponse: verifyOtpResponse ?? this.verifyOtpResponse,
    );
  }
}
