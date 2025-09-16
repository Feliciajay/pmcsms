class GetDraftByIdRequest {
  final String process;
  final String action;
  final int draftId;

  GetDraftByIdRequest({
    required this.process,
    required this.action,
    required this.draftId,
  });

  GetDraftByIdRequest copyWith({
    String? process,
    String? action,
    int? draftId,
  }) =>
      GetDraftByIdRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        draftId: draftId ?? this.draftId,
      );

  factory GetDraftByIdRequest.fromJson(Map<String, dynamic> json) =>
      GetDraftByIdRequest(
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
