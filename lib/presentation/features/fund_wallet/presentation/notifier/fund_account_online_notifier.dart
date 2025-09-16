import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/fund_account_online_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/repository/fund_account_repository.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/notifier/fund_account_online_state.dart';

class FundAccountOnlineNotifier
    extends AutoDisposeNotifier<FundAccountOnlineNotifierState> {
  FundAccountOnlineNotifier();

  late FundAccountOnlineRepository _fundAccountOnlineRepository;

  @override
  FundAccountOnlineNotifierState build() {
    _fundAccountOnlineRepository =
        ref.read(fundAccountOnlineRepositoryProvider);

    return FundAccountOnlineNotifierState.initial();
  }

  Future<void> fundAccountOnline({
    required FundAccountOnlineRequest data,
    required void Function(String error) onError,
    required void Function(
            String message, String paymentUrl, String transactionId)
        onSuccess,
  }) async {
    state = state.copyWith(fundAccountOnlineState: LoadState.loading);

    try {
      final value = await _fundAccountOnlineRepository.fundAccountOnline(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          fundAccountOnlineState: LoadState.idle,
          fundAccountOnlineResponse: value.data);
      onSuccess(value.data!.serverMessage!, value.data?.data?.checkoutUrl ?? '',
          value.data?.data?.transactionId ?? '');
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(fundAccountOnlineState: LoadState.idle);
    }
  }
}

final fundAccountOnlineNotifier = NotifierProvider.autoDispose<
    FundAccountOnlineNotifier, FundAccountOnlineNotifierState>(
  FundAccountOnlineNotifier.new,
);
