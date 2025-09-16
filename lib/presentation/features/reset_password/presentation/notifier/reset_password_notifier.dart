import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:pmcsms/presentation/features/reset_password/data/repository/reset_password_repository.dart';
import 'package:pmcsms/presentation/features/reset_password/presentation/notifier/reset_password_state.dart';

class ResetPasswordNotifierNotifier
    extends AutoDisposeNotifier<ResetPasswordNotifierState> {
  ResetPasswordNotifierNotifier();

  late ResetPasswordRepository _resetPasswordRepository;

  @override
  ResetPasswordNotifierState build() {
    _resetPasswordRepository = ref.read(resetPasswordRepositoryProvider);

    return ResetPasswordNotifierState.initial();
  }

  Future<void> resetPassword({
    required ResetPasswordRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(resetPasswordState: LoadState.loading);

    try {
      final value = await _resetPasswordRepository.resetPassword(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage!;

      state = state.copyWith(resetPasswordState: LoadState.idle);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(resetPasswordState: LoadState.idle);
    }
  }
}

final resetPasswordNotifier = NotifierProvider.autoDispose<
    ResetPasswordNotifierNotifier, ResetPasswordNotifierState>(
  ResetPasswordNotifierNotifier.new,
);
