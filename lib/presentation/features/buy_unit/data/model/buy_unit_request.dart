class BuyUnitRequest {
  final String process;
  final String action;
  final String walletType;
  final int amount;
  final String transactPin;

  BuyUnitRequest({
    required this.process,
    required this.action,
    required this.walletType,
    required this.amount,
    required this.transactPin,
  });

  BuyUnitRequest copyWith({
    String? process,
    String? action,
    String? walletType,
    int? amount,
    String? transactPin,
  }) =>
      BuyUnitRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        walletType: walletType ?? this.walletType,
        amount: amount ?? this.amount,
        transactPin: transactPin ?? this.transactPin,
      );

  factory BuyUnitRequest.fromJson(Map<String, dynamic> json) => BuyUnitRequest(
        process: json["process"],
        action: json["action"],
        walletType: json["wallet_type"],
        amount: json["amount"],
        transactPin: json["transact_pin"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "wallet_type": walletType,
        "amount": amount,
        "transact_pin": transactPin,
      };
}
