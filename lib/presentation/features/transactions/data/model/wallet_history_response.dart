class WalletHistoryResponse {
  final String? serverMessage;
  final bool? status;
  final WalletHistoryData? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  WalletHistoryResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  WalletHistoryResponse copyWith({
    String? serverMessage,
    bool? status,
    WalletHistoryData? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      WalletHistoryResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory WalletHistoryResponse.fromJson(Map<String, dynamic> json) =>
      WalletHistoryResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : WalletHistoryData.fromJson(json["data"]),
        dataResult: json["data_result"] == null
            ? []
            : List<dynamic>.from(json["data_result"]!.map((x) => x)),
        errorData: json["error_data"] == null
            ? []
            : List<dynamic>.from(json["error_data"]!.map((x) => x)),
        textStatus: json["text_status"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "server_message": serverMessage,
        "status": status,
        "data": data?.toJson(),
        "data_result": dataResult == null
            ? []
            : List<dynamic>.from(dataResult!.map((x) => x)),
        "error_data": errorData == null
            ? []
            : List<dynamic>.from(errorData!.map((x) => x)),
        "text_status": textStatus,
        "error": error,
      };
}

class WalletHistoryData {
  final List<UserWalletHistory>? history;
  final Statistics? statistics;

  WalletHistoryData({
    this.history,
    this.statistics,
  });

  WalletHistoryData copyWith({
    List<UserWalletHistory>? history,
    Statistics? statistics,
  }) =>
      WalletHistoryData(
        history: history ?? this.history,
        statistics: statistics ?? this.statistics,
      );

  factory WalletHistoryData.fromJson(Map<String, dynamic> json) =>
      WalletHistoryData(
        history: json["history"] == null
            ? []
            : List<UserWalletHistory>.from(
                json["history"]!.map((x) => UserWalletHistory.fromJson(x))),
        statistics: json["statistics"] == null
            ? null
            : Statistics.fromJson(json["statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "history": history == null
            ? []
            : List<dynamic>.from(history!.map((x) => x.toJson())),
        "statistics": statistics?.toJson(),
      };
}

class UserWalletHistory {
  final int? walletId;
  final String? purpose;
  final String? amount;
  final DateTime? date;
  final String? process;
  final String? status;

  UserWalletHistory({
    this.walletId,
    this.purpose,
    this.amount,
    this.date,
    this.process,
    this.status,
  });

  UserWalletHistory copyWith({
    int? walletId,
    String? purpose,
    String? amount,
    DateTime? date,
    String? process,
    String? status,
  }) =>
      UserWalletHistory(
        walletId: walletId ?? this.walletId,
        purpose: purpose ?? this.purpose,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        process: process ?? this.process,
        status: status ?? this.status,
      );

  factory UserWalletHistory.fromJson(Map<String, dynamic> json) =>
      UserWalletHistory(
        walletId: json["wallet_id"],
        purpose: json["purpose"],
        amount: json["amount"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        process: json["process"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "wallet_id": walletId,
        "purpose": purpose,
        "amount": amount,
        "date": date?.toIso8601String(),
        "process": process,
        "status": status,
      };
}

class Statistics {
  final int? pendingCount;
  final int? successfulCount;
  final int? failedCount;
  final int? totalCount;

  Statistics({
    this.pendingCount,
    this.successfulCount,
    this.failedCount,
    this.totalCount,
  });

  Statistics copyWith({
    int? pendingCount,
    int? successfulCount,
    int? failedCount,
    int? totalCount,
  }) =>
      Statistics(
        pendingCount: pendingCount ?? this.pendingCount,
        successfulCount: successfulCount ?? this.successfulCount,
        failedCount: failedCount ?? this.failedCount,
        totalCount: totalCount ?? this.totalCount,
      );

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        pendingCount: json["pending_count"],
        successfulCount: json["successful_count"],
        failedCount: json["failed_count"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "pending_count": pendingCount,
        "successful_count": successfulCount,
        "failed_count": failedCount,
        "total_count": totalCount,
      };
}
