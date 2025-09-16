class SignUpRequest {
  final String process;
  final String action;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;
  final String phone;
  final String country;
  final String referral;

  SignUpRequest({
    required this.process,
    required this.action,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.country,
    required this.referral,
  });

  SignUpRequest copyWith({
    String? process,
    String? action,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? confirmPassword,
    String? phone,
    String? country,
    String? referral,
  }) =>
      SignUpRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        phone: phone ?? this.phone,
        country: country ?? this.country,
        referral: referral ?? this.referral,
      );

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        process: json["process"],
        action: json["action"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        phone: json["phone"],
        country: json["country"],
        referral: json["referral"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "confirm_password": confirmPassword,
        "phone": phone,
        "country": country,
        "referral": referral,
      };
}
