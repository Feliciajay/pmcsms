import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/confirm_payment_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/repository/confirm_fund_account_repository.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/notifier/confirm_fund_account_online_state.dart';

class ConfirmFundAccountOnlineNotifier
    extends AutoDisposeNotifier<ConfirmFundAccountOnlineNotifierState> {
  ConfirmFundAccountOnlineNotifier();

  late ConfirmFundAccountOnlineRepository _confirmFundAccountOnlineRepository;

  @override
  ConfirmFundAccountOnlineNotifierState build() {
    _confirmFundAccountOnlineRepository =
        ref.read(confirmFundAccountOnlineRepositoryProvider);

    return ConfirmFundAccountOnlineNotifierState.initial();
  }

  Future<void> confirmFundAccountOnline({
    required ConfirmPaymentRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(confirmFundAccountOnlineState: LoadState.loading);

    try {
      final value =
          await _confirmFundAccountOnlineRepository.confirmFundAccount(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          confirmFundAccountOnlineState: LoadState.idle,
          confirmFundAccountOnlineResponse: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(confirmFundAccountOnlineState: LoadState.idle);
    }
  }
}

final confirmFundAccountOnlineNotifier = NotifierProvider.autoDispose<
    ConfirmFundAccountOnlineNotifier, ConfirmFundAccountOnlineNotifierState>(
  ConfirmFundAccountOnlineNotifier.new,
);
