import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_response.dart';

class GetBalanceNotifierState {
  GetBalanceNotifierState({
    required this.inputValid,
    required this.getBalanceState,
    required this.getBalanceResponse,
  });
  factory GetBalanceNotifierState.initial() {
    return GetBalanceNotifierState(
      inputValid: false,
      getBalanceState: LoadState.idle,
      getBalanceResponse: null,
    );
  }
  final bool inputValid;
  final LoadState getBalanceState;
  final GetBalanceResponse? getBalanceResponse;
  GetBalanceNotifierState copyWith({
    bool? inputValid,
    LoadState? getBalanceState,
    GetBalanceResponse? getBalanceResponse,
  }) {
    return GetBalanceNotifierState(
      inputValid: inputValid ?? this.inputValid,
      getBalanceState: getBalanceState ?? this.getBalanceState,
      getBalanceResponse: getBalanceResponse ?? this.getBalanceResponse,
    );
  }
}
