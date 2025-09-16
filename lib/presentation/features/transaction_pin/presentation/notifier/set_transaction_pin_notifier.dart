import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';

import 'package:pmcsms/presentation/features/transaction_pin/data/repository/set_transaction_pin_repository.dart';
import 'package:pmcsms/presentation/features/transaction_pin/data/set_transaction_pin_request.dart';
import 'package:pmcsms/presentation/features/transaction_pin/data/set_transaction_pin_response.dart';

class SetTransactionPinNotifier
    extends AutoDisposeNotifier<BaseState<SetTransactionPinResponse>> {
  SetTransactionPinNotifier();

  late SetTransactionPinRepository _setTransactionPinRepository;

  @override
  BaseState<SetTransactionPinResponse> build() {
    _setTransactionPinRepository =
        ref.read(setTransactionPinRepositoryProvider);

    return BaseState<SetTransactionPinResponse>.initial();
  }

  Future<void> setTransactionPin({
    required SetTransactionPinRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _setTransactionPinRepository.setTransactionPin(data);
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

final setTransactionPinNotifier = NotifierProvider.autoDispose<
    SetTransactionPinNotifier, BaseState<SetTransactionPinResponse>>(
  SetTransactionPinNotifier.new,
);
