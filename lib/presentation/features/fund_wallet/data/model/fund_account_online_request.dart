
class FundAccountOnlineRequest {
    final String process;
    final String action;
    final String channel;
    final String amount;

    FundAccountOnlineRequest({
        required this.process,
        required this.action,
        required this.channel,
        required this.amount,
    });

    FundAccountOnlineRequest copyWith({
        String? process,
        String? action,
        String? channel,
        String? amount,
    }) => 
        FundAccountOnlineRequest(
            process: process ?? this.process,
            action: action ?? this.action,
            channel: channel ?? this.channel,
            amount: amount ?? this.amount,
        );

    factory FundAccountOnlineRequest.fromJson(Map<String, dynamic> json) => FundAccountOnlineRequest(
        process: json["process"],
        action: json["action"],
        channel: json["channel"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "channel": channel,
        "amount": amount,
    };
}
