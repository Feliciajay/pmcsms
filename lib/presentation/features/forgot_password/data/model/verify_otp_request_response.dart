class VerifyOtpResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  VerifyOtpResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  VerifyOtpResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      VerifyOtpResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
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
  final int? id;
  final int? userId;
  final String? phoneOrEmail;
  final String? code;
  final String? status;
  final String? useCase;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.phoneOrEmail,
    this.code,
    this.status,
    this.useCase,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    int? userId,
    String? phoneOrEmail,
    String? code,
    String? status,
    String? useCase,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        phoneOrEmail: phoneOrEmail ?? this.phoneOrEmail,
        code: code ?? this.code,
        status: status ?? this.status,
        useCase: useCase ?? this.useCase,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        phoneOrEmail: json["phone_or_email"],
        code: json["code"],
        status: json["status"],
        useCase: json["use_case"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "phone_or_email": phoneOrEmail,
        "code": code,
        "status": status,
        "use_case": useCase,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
