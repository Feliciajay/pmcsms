class TransferFundsRequest {
  final String process;
  final String action;
  final String walletType;
  final String username;
  final int amount;
  final String transactPin;

  TransferFundsRequest({
    required this.process,
    required this.action,
    required this.walletType,
    required this.username,
    required this.amount,
    required this.transactPin,
  });

  TransferFundsRequest copyWith({
    String? process,
    String? action,
    String? walletType,
    String? username,
    int? amount,
    String? transactPin,
  }) =>
      TransferFundsRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        walletType: walletType ?? this.walletType,
        username: username ?? this.username,
        amount: amount ?? this.amount,
        transactPin: transactPin ?? this.transactPin,
      );

  factory TransferFundsRequest.fromJson(Map<String, dynamic> json) =>
      TransferFundsRequest(
        process: json["process"],
        action: json["action"],
        walletType: json["wallet_type"],
        username: json["username"],
        amount: json["amount"],
        transactPin: json["transact_pin"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "wallet_type": walletType,
        "username": username,
        "amount": amount,
        "transact_pin": transactPin,
      };
}
