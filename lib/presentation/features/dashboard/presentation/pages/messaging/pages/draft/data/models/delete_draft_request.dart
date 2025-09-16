class DeleteDraftRequest {
  final String process;
  final String action;
  final int draftId;

  DeleteDraftRequest({
    required this.process,
    required this.action,
    required this.draftId,
  });

  DeleteDraftRequest copyWith({
    String? process,
    String? action,
    int? draftId,
  }) =>
      DeleteDraftRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        draftId: draftId ?? this.draftId,
      );

  factory DeleteDraftRequest.fromJson(Map<String, dynamic> json) =>
      DeleteDraftRequest(
        process: json["process"],
        action: json["action"],
        draftId: json["draft_id"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "draft_id": draftId,
      };
}
