class VerifyOtpRequest {
  final String process;
  final String action;
  final String email;
  final String otpCode;

  VerifyOtpRequest({
    required this.process,
    required this.action,
    required this.email,
    required this.otpCode,
  });

  VerifyOtpRequest copyWith({
    String? process,
    String? action,
    String? email,
    String? otpCode,
  }) =>
      VerifyOtpRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        email: email ?? this.email,
        otpCode: otpCode ?? this.otpCode,
      );

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRequest(
        process: json["process"],
        action: json["action"],
        email: json["email"],
        otpCode: json["otp_code"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "email": email,
        "otp_code": otpCode,
      };
}
