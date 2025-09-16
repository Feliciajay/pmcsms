class GetAllDraftsRequests {
  final String process;
  final String action;

  GetAllDraftsRequests({
    required this.process,
    required this.action,
  });

  GetAllDraftsRequests copyWith({
    String? process,
    String? action,
  }) =>
      GetAllDraftsRequests(
        process: process ?? this.process,
        action: action ?? this.action,
      );

  factory GetAllDraftsRequests.fromJson(Map<String, dynamic> json) =>
      GetAllDraftsRequests(
        process: json["process"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
      };
}
