import 'package:pmcsms/core/utils/enums.dart';

class VerifyOtpNotifierState {
  VerifyOtpNotifierState({
    required this.verifyOtpState,
  });
  factory VerifyOtpNotifierState.initial() {
    return VerifyOtpNotifierState(
      verifyOtpState: LoadState.idle,
    );
  }

  final LoadState verifyOtpState;
  VerifyOtpNotifierState copyWith({
    LoadState? verifyOtpState,
  }) {
    return VerifyOtpNotifierState(
      verifyOtpState: verifyOtpState ?? this.verifyOtpState,
    );
  }
}
