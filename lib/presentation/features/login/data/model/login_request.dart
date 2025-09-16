class LoginRequest {
  final String process;
  final String action;
  final String userinfo;
  final String password;

  LoginRequest({
    required this.process,
    required this.action,
    required this.userinfo,
    required this.password,
  });

  LoginRequest copyWith({
    String? process,
    String? action,
    String? userinfo,
    String? password,
  }) =>
      LoginRequest(
        process: process ?? this.process,
        action: action ?? this.action,
        userinfo: userinfo ?? this.userinfo,
        password: password ?? this.password,
      );

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        process: json["process"],
        action: json["action"],
        userinfo: json["userinfo"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "userinfo": userinfo,
        "password": password,
      };
}
