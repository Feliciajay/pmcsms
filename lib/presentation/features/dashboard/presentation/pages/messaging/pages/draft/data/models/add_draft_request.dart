class AddDraftsRequests {
  final String process;
  final String action;
  final String title;
  final String message;

  AddDraftsRequests({
    required this.process,
    required this.action,
    required this.title,
    required this.message,
  });

  AddDraftsRequests copyWith({
    String? process,
    String? action,
    String? title,
    String? message,
  }) =>
      AddDraftsRequests(
        process: process ?? this.process,
        action: action ?? this.action,
        title: title ?? this.title,
        message: message ?? this.message,
      );

  factory AddDraftsRequests.fromJson(Map<String, dynamic> json) =>
      AddDraftsRequests(
        process: json["process"],
        action: json["action"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "title": title,
        "message": message,
      };
}
