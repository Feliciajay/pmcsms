class ConfirmPaymentRequest {
  final String process;
  final String action;
  final String transactionId;

  ConfirmPaymentRequest({
    required this.process,
    required this.action,
    required this.transactionId,
  });

  ConfirmPaymentRequest copyWith({
    String? process,
    String? action,
    String? transactionId,
  }) =>
      ConfirmPaymentRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        transactionId: transactionId ?? this.transactionId,
      );

  factory ConfirmPaymentRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmPaymentRequest(
        process: json["process"],
        action: json["action"],
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "transaction_id": transactionId,
      };
}
