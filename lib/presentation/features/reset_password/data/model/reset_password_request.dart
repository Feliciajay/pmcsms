class ResetPasswordRequest {
  final String process;
  final String action;
  final String otpCode;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordRequest({
    required this.process,
    required this.action,
    required this.otpCode,
    required this.newPassword,
    required this.confirmPassword,
  });

  ResetPasswordRequest copyWith({
    String? process,
    String? action,
    String? otpCode,
    String? newPassword,
    String? confirmPassword,
  }) =>
      ResetPasswordRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        otpCode: otpCode ?? this.otpCode,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        process: json["process"],
        action: json["action"],
        otpCode: json["otp_code"],
        newPassword: json["new_password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "otp_code": otpCode,
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      };
}
