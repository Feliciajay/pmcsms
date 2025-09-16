class DeleteGroupRequest {
  final String process;
  final String action;
  final int groupId;

  DeleteGroupRequest({
    required this.process,
    required this.action,
    required this.groupId,
  });

  DeleteGroupRequest copyWith({
    String? process,
    String? action,
    int? groupId,
  }) =>
      DeleteGroupRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        groupId: groupId ?? this.groupId,
      );

  factory DeleteGroupRequest.fromJson(Map<String, dynamic> json) =>
      DeleteGroupRequest(
        process: json["process"],
        action: json["action"],
        groupId: json["group_id"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "group_id": groupId,
      };
}
