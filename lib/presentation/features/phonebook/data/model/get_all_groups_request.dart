class GetAllGroupsRequest {
  final String process;
  final String action;

  GetAllGroupsRequest({
    required this.process,
    required this.action,
  });

  GetAllGroupsRequest copyWith({
    String? process,
    String? action,
  }) =>
      GetAllGroupsRequest(
        process: process ?? this.process,
        action: action ?? this.action,
      );

  factory GetAllGroupsRequest.fromJson(Map<String, dynamic> json) =>
      GetAllGroupsRequest(
        process: json["process"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
      };
}
