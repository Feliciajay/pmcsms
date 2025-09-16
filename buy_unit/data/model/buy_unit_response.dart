class BuyUnitResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  BuyUnitResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  BuyUnitResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      BuyUnitResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory BuyUnitResponse.fromJson(Map<String, dynamic> json) =>
      BuyUnitResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  final int? amount;
  final int? conversionRate;
  final int? unitValue;
  final String? wallet;

  Data({
    this.amount,
    this.conversionRate,
    this.unitValue,
    this.wallet,
  });

  Data copyWith({
    int? amount,
    int? conversionRate,
    int? unitValue,
    String? wallet,
  }) =>
      Data(
        amount: amount ?? this.amount,
        conversionRate: conversionRate ?? this.conversionRate,
        unitValue: unitValue ?? this.unitValue,
        wallet: wallet ?? this.wallet,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"],
        conversionRate: json["conversion_rate"],
        unitValue: json["unit_value"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "conversion_rate": conversionRate,
        "unit_value": unitValue,
        "wallet": wallet,
      };
}
