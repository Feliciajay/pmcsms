import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';

class LoginNotifierState {
  LoginNotifierState({
    required this.inputValid,
    required this.loginState,
    required this.loginResponse,
  });
  factory LoginNotifierState.initial() {
    return LoginNotifierState(
      inputValid: false,
      loginState: LoadState.idle,
      loginResponse: null,
    );
  }
  final bool inputValid;
  final LoadState loginState;
  final LoginResponse? loginResponse;
  LoginNotifierState copyWith({
    bool? inputValid,
    LoadState? loginState,
    LoginResponse? loginResponse,
  }) {
    return LoginNotifierState(
      inputValid: inputValid ?? this.inputValid,
      loginState: loginState ?? this.loginState,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
