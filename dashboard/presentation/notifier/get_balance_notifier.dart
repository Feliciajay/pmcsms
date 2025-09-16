import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_request.dart';
import 'package:pmcsms/presentation/features/dashboard/data/repository/get_wallet_balance_repository.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/notifier/get_balance_state.dart';

class GetBalanceNotifierNotifier
    extends AutoDisposeNotifier<GetBalanceNotifierState> {
  GetBalanceNotifierNotifier();

  late GetBalanceRepository _getWalletRepository;

  @override
  GetBalanceNotifierState build() {
    _getWalletRepository = ref.read(getWalletBalanceRepositoryProvider);

    return GetBalanceNotifierState.initial();
  }

  Future<void> getWalletBalance(
      //   {
      //   required LoginRequest data,
      //   required void Function(String error) onError,
      //   required void Function(String message) onSuccess,
      // }
      ) async {
    state = state.copyWith(getBalanceState: LoadState.loading);
    final data = GetBalanceRequest(action: 'balance', process: 'pm_wallet');
    try {
      final value =
          await _getWalletRepository.getWalletBalance(getBalanceRequest: data);
      //debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          getBalanceState: LoadState.idle, getBalanceResponse: value.data);
      // ref.read(getTransactionPinNotifier.notifier);
      // onSuccess(value.data!.serverMessage!);
    } catch (e) {
      // onError(e.toString());
      state = state.copyWith(getBalanceState: LoadState.idle);
    }
  }
}

final getWalletBalanceNotifier = NotifierProvider.autoDispose<
    GetBalanceNotifierNotifier, GetBalanceNotifierState>(
  GetBalanceNotifierNotifier.new,
);
