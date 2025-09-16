class UpdateDraftRequest {
  final String process;
  final String action;
  final int draftId;
  final String title;
  final String message;

  UpdateDraftRequest({
    required this.process,
    required this.action,
    required this.draftId,
    required this.title,
    required this.message,
  });

  UpdateDraftRequest copyWith({
    String? process,
    String? action,
    int? draftId,
    String? title,
    String? message,
  }) =>
      UpdateDraftRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        draftId: draftId ?? this.draftId,
        title: title ?? this.title,
        message: message ?? this.message,
      );

  factory UpdateDraftRequest.fromJson(Map<String, dynamic> json) =>
      UpdateDraftRequest(
        process: json["process"],
        action: json["action"],
        draftId: json["draft_id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "draft_id": draftId,
        "title": title,
        "message": message,
      };
}
