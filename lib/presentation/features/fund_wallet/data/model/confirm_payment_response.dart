class ConfirmPaymentResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  ConfirmPaymentResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  ConfirmPaymentResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      ConfirmPaymentResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory ConfirmPaymentResponse.fromJson(Map<String, dynamic> json) =>
      ConfirmPaymentResponse(
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
  final String? serverMessage;
  final bool? status;

  Data({
    this.serverMessage,
    this.status,
  });

  Data copyWith({
    String? serverMessage,
    bool? status,
  }) =>
      Data(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        serverMessage: json["server_message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "server_message": serverMessage,
        "status": status,
      };
}
