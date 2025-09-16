class WalletHistoryRequest {
  final String process;
  final String action;
  final int? start;
  final int? length;
  final String? processType;
  final String? status;
  final String? startDate;
  final String? endDate;

  WalletHistoryRequest({
    required this.process,
    required this.action,
    this.start,
    this.length,
    this.processType,
    this.status,
    this.startDate,
    this.endDate,
  });

  WalletHistoryRequest copyWith({
    String? process,
    String? action,
    int? start,
    int? length,
    String? processType,
    String? status,
    String? startDate,
    String? endDate,
  }) =>
      WalletHistoryRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        start: start ?? this.start,
        length: length ?? this.length,
        processType: processType ?? this.processType,
        status: status ?? this.status,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  factory WalletHistoryRequest.fromJson(Map<String, dynamic> json) =>
      WalletHistoryRequest(
        process: json["process"],
        action: json["action"],
        start: json["start"],
        length: json["length"],
        processType: json["process_type"],
        status: json["status"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "start": start,
        "length": length,
        "process_type": processType,
        "status": status,
        "start_date": startDate,
        "end_date": endDate,
      };
}
