class VerifySignupEmailOtpRequest {
  final String process;
  final String action;
  final String otpCode;
  final String email;

  VerifySignupEmailOtpRequest({
    required this.process,
    required this.action,
    required this.otpCode,
    required this.email,
  });

  VerifySignupEmailOtpRequest copyWith({
    String? process,
    String? action,
    String? otpCode,
    String? email,
  }) =>
      VerifySignupEmailOtpRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        otpCode: otpCode ?? this.otpCode,
        email: email ?? this.email,
      );

  factory VerifySignupEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifySignupEmailOtpRequest(
        process: json["process"],
        action: json["action"],
        otpCode: json["otp_code"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "otp_code": otpCode,
        "email": email,
      };
}
