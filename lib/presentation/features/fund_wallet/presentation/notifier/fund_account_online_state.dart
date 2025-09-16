import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/fund_account_online_response.dart';

class FundAccountOnlineNotifierState {
  FundAccountOnlineNotifierState({
    required this.inputValid,
    required this.fundAccountOnlineState,
    required this.fundAccountOnlineResponse,
  });
  factory FundAccountOnlineNotifierState.initial() {
    return FundAccountOnlineNotifierState(
      inputValid: false,
      fundAccountOnlineState: LoadState.idle,
      fundAccountOnlineResponse: null,
    );
  }
  final bool inputValid;
  final LoadState fundAccountOnlineState;
  final FundAccountOnlineResponse? fundAccountOnlineResponse;
  FundAccountOnlineNotifierState copyWith({
    bool? inputValid,
    LoadState? fundAccountOnlineState,
    FundAccountOnlineResponse? fundAccountOnlineResponse,
  }) {
    return FundAccountOnlineNotifierState(
      inputValid: inputValid ?? this.inputValid,
      fundAccountOnlineState:
          fundAccountOnlineState ?? this.fundAccountOnlineState,
      fundAccountOnlineResponse:
          fundAccountOnlineResponse ?? this.fundAccountOnlineResponse,
    );
  }
}
