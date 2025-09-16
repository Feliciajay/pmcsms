import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/model/transfer_funds_request.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/model/transfer_funds_response.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/repository/transfer_funds_repository.dart';

class TransferFundsNotifier
    extends AutoDisposeNotifier<BaseState<TransferFundsReponse>> {
  TransferFundsNotifier();

  late TransferFundsRepository _transferFundsRepository;

  @override
  BaseState<TransferFundsReponse> build() {
    _transferFundsRepository = ref.read(transferFundsRepositoryProvider);

    return BaseState<TransferFundsReponse>.initial();
  }

  Future<void> transferFunds({
    required TransferFundsRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _transferFundsRepository.transferFunds(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.idle, data: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final transferFundsNotifier = NotifierProvider.autoDispose<
    TransferFundsNotifier, BaseState<TransferFundsReponse>>(
  TransferFundsNotifier.new,
);
