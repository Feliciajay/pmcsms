class GetBalanceRequest {
  final String process;
  final String action;

  GetBalanceRequest({
    required this.process,
    required this.action,
  });

  GetBalanceRequest copyWith({
    String? process,
    String? action,
  }) =>
      GetBalanceRequest(
        process: process ?? this.process,
        action: action ?? this.action,
      );

  factory GetBalanceRequest.fromJson(Map<String, dynamic> json) =>
      GetBalanceRequest(
        process: json["process"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
      };
}
