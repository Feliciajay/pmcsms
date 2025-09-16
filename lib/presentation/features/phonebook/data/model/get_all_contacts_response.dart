class GetAllContactsResponse {
  final String? serverMessage;
  final bool? status;
  final List<GetAllContactsData>? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  GetAllContactsResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  GetAllContactsResponse copyWith({
    String? serverMessage,
    bool? status,
    List<GetAllContactsData>? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      GetAllContactsResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory GetAllContactsResponse.fromJson(Map<String, dynamic> json) =>
      GetAllContactsResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<GetAllContactsData>.from(
                json["data"]!.map((x) => GetAllContactsData.fromJson(x))),
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

class GetAllContactsData {
  final int? addressId;
  final String? ownerName;
  final String? addressBook;
  final String? groupName;
  final int? groupId;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;

  GetAllContactsData({
    this.addressId,
    this.ownerName,
    this.addressBook,
    this.groupName,
    this.groupId,
    this.dateCreated,
    this.dateUpdated,
  });

  GetAllContactsData copyWith({
    int? addressId,
    String? ownerName,
    String? addressBook,
    String? groupName,
    int? groupId,
    DateTime? dateCreated,
    DateTime? dateUpdated,
  }) =>
      GetAllContactsData(
        addressId: addressId ?? this.addressId,
        ownerName: ownerName ?? this.ownerName,
        addressBook: addressBook ?? this.addressBook,
        groupName: groupName ?? this.groupName,
        groupId: groupId ?? this.groupId,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
      );

  factory GetAllContactsData.fromJson(Map<String, dynamic> json) =>
      GetAllContactsData(
        addressId: json["address_id"],
        ownerName: json["owner_name"],
        addressBook: json["address_book"],
        groupName: json["group_name"],
        groupId: json["group_id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateUpdated: json["date_updated"] == null
            ? null
            : DateTime.parse(json["date_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "owner_name": ownerName,
        "address_book": addressBook,
        "group_name": groupName,
        "group_id": groupId,
        "date_created": dateCreated?.toIso8601String(),
        "date_updated": dateUpdated?.toIso8601String(),
      };
}
