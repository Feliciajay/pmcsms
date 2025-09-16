class ForgotPasswordRequest {
  final String process;
  final String action;
  final String email;

  ForgotPasswordRequest({
    required this.process,
    required this.action,
    required this.email,
  });

  ForgotPasswordRequest copyWith({
    String? process,
    String? action,
    String? email,
  }) =>
      ForgotPasswordRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        email: email ?? this.email,
      );

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequest(
        process: json["process"],
        action: json["action"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "email": email,
      };
}
