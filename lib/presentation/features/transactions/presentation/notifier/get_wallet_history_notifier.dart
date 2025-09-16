import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/utils/enums.dart';

import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_request.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_response.dart';
import 'package:pmcsms/presentation/features/transactions/data/repository/get_wallet_history_repository.dart';

class GetWalletHistoryNotifier
    extends AutoDisposeNotifier<BaseState<WalletHistoryResponse>> {
  GetWalletHistoryNotifier();

  late GetWalletHistoryRepository _getWalletHistoryRepository;

  @override
  BaseState<WalletHistoryResponse> build() {
    _getWalletHistoryRepository = ref.read(getWalletHistoryRepositoryProvider);

    return BaseState<WalletHistoryResponse>.initial();
  }

  Future<void> getWalletHistory({
    required WalletHistoryRequest data,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _getWalletHistoryRepository.getWalletHistory(data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.idle, data: value.data);
      //  onSuccess(value.data!.serverMessage!);
    } catch (e) {
      // onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final getWalletHistoryNotifier = NotifierProvider.autoDispose<
    GetWalletHistoryNotifier, BaseState<WalletHistoryResponse>>(
  GetWalletHistoryNotifier.new,
);
