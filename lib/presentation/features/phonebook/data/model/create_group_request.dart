class CreateGroupRequest {
  final String process;
  final String action;
  final String groupName;

  CreateGroupRequest({
    required this.process,
    required this.action,
    required this.groupName,
  });

  CreateGroupRequest copyWith({
    String? process,
    String? action,
    String? groupName,
  }) =>
      CreateGroupRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        groupName: groupName ?? this.groupName,
      );

  factory CreateGroupRequest.fromJson(Map<String, dynamic> json) =>
      CreateGroupRequest(
        process: json["process"],
        action: json["action"],
        groupName: json["group_name"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "group_name": groupName,
      };
}
