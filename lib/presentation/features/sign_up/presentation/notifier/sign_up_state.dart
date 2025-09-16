import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_response.dart';

class SignUpNotifierState {
  SignUpNotifierState({
    required this.inputValid,
    required this.signUpState,
    required this.signUpResponse,
  });
  factory SignUpNotifierState.initial() {
    return SignUpNotifierState(
      inputValid: false,
      signUpState: LoadState.idle,
      signUpResponse: SignUpResponse(),
    );
  }
  final bool inputValid;
  final LoadState signUpState;
  final SignUpResponse signUpResponse;
  SignUpNotifierState copyWith({
    bool? inputValid,
    LoadState? signUpState,
    SignUpResponse? signUpResponse,
  }) {
    return SignUpNotifierState(
      inputValid: inputValid ?? this.inputValid,
      signUpState: signUpState ?? this.signUpState,
      signUpResponse: signUpResponse ?? this.signUpResponse,
    );
  }
}
