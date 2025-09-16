class DeleteContactRequest {
  final String process;
  final String action;
  final int addressBookId;

  DeleteContactRequest({
    required this.process,
    required this.action,
    required this.addressBookId,
  });

  DeleteContactRequest copyWith({
    String? process,
    String? action,
    int? addressBookId,
  }) =>
      DeleteContactRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        addressBookId: addressBookId ?? this.addressBookId,
      );

  factory DeleteContactRequest.fromJson(Map<String, dynamic> json) =>
      DeleteContactRequest(
        process: json["process"],
        action: json["action"],
        addressBookId: json["address_book_id"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "address_book_id": addressBookId,
      };
}
