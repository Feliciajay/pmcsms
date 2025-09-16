class SetTransactionPinRequest {
  final String process;
  final String action;
  final String currentPin;
  final String newPin;
  final String confirmNewPin;

  SetTransactionPinRequest({
    required this.process,
    required this.action,
    required this.currentPin,
    required this.newPin,
    required this.confirmNewPin,
  });

  SetTransactionPinRequest copyWith({
    String? process,
    String? action,
    String? currentPin,
    String? newPin,
    String? confirmNewPin,
  }) =>
      SetTransactionPinRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        currentPin: currentPin ?? this.currentPin,
        newPin: newPin ?? this.newPin,
        confirmNewPin: confirmNewPin ?? this.confirmNewPin,
      );

  factory SetTransactionPinRequest.fromJson(Map<String, dynamic> json) =>
      SetTransactionPinRequest(
        process: json["process"],
        action: json["action"],
        currentPin: json["current_pin"],
        newPin: json["new_pin"],
        confirmNewPin: json["confirm_new_pin"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "current_pin": currentPin,
        "new_pin": newPin,
        "confirm_new_pin": confirmNewPin,
      };
}
