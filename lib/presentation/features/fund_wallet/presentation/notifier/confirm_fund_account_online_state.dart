import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/confirm_payment_response.dart';

class ConfirmFundAccountOnlineNotifierState {
  ConfirmFundAccountOnlineNotifierState({
    required this.inputValid,
    required this.confirmFundAccountOnlineState,
    required this.confirmFundAccountOnlineResponse,
  });
  factory ConfirmFundAccountOnlineNotifierState.initial() {
    return ConfirmFundAccountOnlineNotifierState(
      inputValid: false,
      confirmFundAccountOnlineState: LoadState.idle,
      confirmFundAccountOnlineResponse: null,
    );
  }
  final bool inputValid;
  final LoadState confirmFundAccountOnlineState;
  final ConfirmPaymentResponse? confirmFundAccountOnlineResponse;
  ConfirmFundAccountOnlineNotifierState copyWith({
    bool? inputValid,
    LoadState? confirmFundAccountOnlineState,
    ConfirmPaymentResponse? confirmFundAccountOnlineResponse,
  }) {
    return ConfirmFundAccountOnlineNotifierState(
      inputValid: inputValid ?? this.inputValid,
      confirmFundAccountOnlineState:
          confirmFundAccountOnlineState ?? this.confirmFundAccountOnlineState,
      confirmFundAccountOnlineResponse: confirmFundAccountOnlineResponse ??
          this.confirmFundAccountOnlineResponse,
    );
  }
}
