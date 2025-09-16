class GetDraftByIdResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  GetDraftByIdResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  GetDraftByIdResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      GetDraftByIdResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory GetDraftByIdResponse.fromJson(Map<String, dynamic> json) =>
      GetDraftByIdResponse(
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
  final int? draftId;
  final int? draftUserId;
  final String? draftTitle;
  final String? draftMessage;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;

  Data({
    this.draftId,
    this.draftUserId,
    this.draftTitle,
    this.draftMessage,
    this.dateCreated,
    this.dateUpdated,
  });

  Data copyWith({
    int? draftId,
    int? draftUserId,
    String? draftTitle,
    String? draftMessage,
    DateTime? dateCreated,
    DateTime? dateUpdated,
  }) =>
      Data(
        draftId: draftId ?? this.draftId,
        draftUserId: draftUserId ?? this.draftUserId,
        draftTitle: draftTitle ?? this.draftTitle,
        draftMessage: draftMessage ?? this.draftMessage,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        draftId: json["draft_id"],
        draftUserId: json["draft_user_id"],
        draftTitle: json["draft_title"],
        draftMessage: json["draft_message"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateUpdated: json["date_updated"] == null
            ? null
            : DateTime.parse(json["date_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "draft_id": draftId,
        "draft_user_id": draftUserId,
        "draft_title": draftTitle,
        "draft_message": draftMessage,
        "date_created": dateCreated?.toIso8601String(),
        "date_updated": dateUpdated?.toIso8601String(),
      };
}
