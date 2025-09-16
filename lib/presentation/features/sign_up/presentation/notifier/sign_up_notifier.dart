import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_request.dart';
import 'package:pmcsms/presentation/features/sign_up/data/repository/sign_up_repository.dart';
import 'package:pmcsms/presentation/features/sign_up/presentation/notifier/sign_up_state.dart';

class SignUpNotifierNotifier extends AutoDisposeNotifier<SignUpNotifierState> {
  SignUpNotifierNotifier();

  late SignUpRepository _signUpRepository;

  @override
  SignUpNotifierState build() {
    _signUpRepository = ref.read(signUpRepositoryProvider);

    return SignUpNotifierState.initial();
  }

  void allInputValid({
    required bool firstNameValid,
    required bool lastNameValid,
    required bool userNameValid,
    required bool phoneNumberValid,
    required bool emailValid,
    required bool passwordValid,
  }) {
    state = state.copyWith(
      inputValid: emailValid &&
          passwordValid &&
          firstNameValid &&
          lastNameValid &&
          phoneNumberValid &&
          userNameValid,
    );
  }

  Future<void> signUp({
    required SignUpRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(signUpState: LoadState.loading);

    try {
      final value = await _signUpRepository.signUp(data);
      debugLog(data);
      if (!value.status) {
        if (value.errorData.isNotEmpty || value.errorData != null) {
          throw value.errorData['error_phone_exist'] ??
              value.errorData?['error_email_exist'] ??
              value.errorData?['error_password_confirmation'] ??
              value.errorData?['error_username'];
        } else {
          throw value.serverMessage.toString();
        }
      }

      state = state.copyWith(
        signUpState: LoadState.idle,
        signUpResponse: value.data,
      );
      onSuccess("${value.data?.serverMessage}");
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(signUpState: LoadState.idle);
    }
  }
}

final signUpNotifier =
    NotifierProvider.autoDispose<SignUpNotifierNotifier, SignUpNotifierState>(
  SignUpNotifierNotifier.new,
);
