class GetAllGroupsResponse {
  final String? serverMessage;
  final bool? status;
  final List<AllGroupsData>? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  GetAllGroupsResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  GetAllGroupsResponse copyWith({
    String? serverMessage,
    bool? status,
    List<AllGroupsData>? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      GetAllGroupsResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory GetAllGroupsResponse.fromJson(Map<String, dynamic> json) =>
      GetAllGroupsResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<AllGroupsData>.from(
                json["data"]!.map((x) => AllGroupsData.fromJson(x))),
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
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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

class AllGroupsData {
  final int? groupId;
  final int? userId;
  final String? groupName;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;
  final int? totalAddressBooks;

  AllGroupsData({
    this.groupId,
    this.userId,
    this.groupName,
    this.dateCreated,
    this.dateUpdated,
    this.totalAddressBooks,
  });

  AllGroupsData copyWith({
    int? groupId,
    int? userId,
    String? groupName,
    DateTime? dateCreated,
    DateTime? dateUpdated,
    int? totalAddressBooks,
  }) =>
      AllGroupsData(
        groupId: groupId ?? this.groupId,
        userId: userId ?? this.userId,
        groupName: groupName ?? this.groupName,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        totalAddressBooks: totalAddressBooks ?? this.totalAddressBooks,
      );

  factory AllGroupsData.fromJson(Map<String, dynamic> json) => AllGroupsData(
        groupId: json["group_id"],
        userId: json["user_id"],
        groupName: json["group_name"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateUpdated: json["date_updated"] == null
            ? null
            : DateTime.parse(json["date_updated"]),
        totalAddressBooks: json["total_address_books"],
      );

  Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "user_id": userId,
        "group_name": groupName,
        "date_created": dateCreated?.toIso8601String(),
        "date_updated": dateUpdated?.toIso8601String(),
        "total_address_books": totalAddressBooks,
      };
}
