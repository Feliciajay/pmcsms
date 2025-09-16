class ResendOtpRequest {
  final String process;
  final String action;
  final String email;

  ResendOtpRequest({
    required this.process,
    required this.action,
    required this.email,
  });

  ResendOtpRequest copyWith({
    String? process,
    String? action,
    String? email,
  }) =>
      ResendOtpRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        email: email ?? this.email,
      );

  factory ResendOtpRequest.fromJson(Map<String, dynamic> json) =>
      ResendOtpRequest(
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
