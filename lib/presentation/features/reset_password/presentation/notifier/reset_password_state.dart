import 'package:pmcsms/core/utils/enums.dart';

class ResetPasswordNotifierState {
  ResetPasswordNotifierState({
    required this.inputValid,
    required this.resetPasswordState,
  });
  factory ResetPasswordNotifierState.initial() {
    return ResetPasswordNotifierState(
      inputValid: false,
      resetPasswordState: LoadState.idle,
    );
  }
  final bool inputValid;
  final LoadState resetPasswordState;
  ResetPasswordNotifierState copyWith({
    bool? inputValid,
    LoadState? resetPasswordState,
  }) {
    return ResetPasswordNotifierState(
      inputValid: inputValid ?? this.inputValid,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
