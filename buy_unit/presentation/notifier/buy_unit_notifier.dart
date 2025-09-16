import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/model/buy_unit_request.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/model/buy_unit_response.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/repository/buy_unit_repository.dart';

class BuyUnitNotifier extends AutoDisposeNotifier<BaseState<BuyUnitResponse>> {
  BuyUnitNotifier();

  late BuyUnitRepository _buyUnitRepository;

  @override
  BaseState<BuyUnitResponse> build() {
    _buyUnitRepository = ref.read(buyUnitRepositoryProvider);

    return BaseState<BuyUnitResponse>.initial();
  }

  Future<void> buyUnit({
    required BuyUnitRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _buyUnitRepository.buyUnit(data);
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

final buyUnitNotifier =
    NotifierProvider.autoDispose<BuyUnitNotifier, BaseState<BuyUnitResponse>>(
  BuyUnitNotifier.new,
);
