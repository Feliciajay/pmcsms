class SignUpResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final dynamic error;

  SignUpResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.error,
  });

  SignUpResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    dynamic error,
  }) =>
      SignUpResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        error: error ?? this.error,
      );

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        dataResult: json["data_result"] == null
            ? []
            : List<dynamic>.from(json["data_result"]!.map((x) => x)),
        errorData: json["error_data"] == null
            ? []
            : List<dynamic>.from(json["error_data"]!.map((x) => x)),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "server_message": serverMessage,
        "status": status,
        "data": data?.toJson(),
        "data_result": dataResult == null
            ? []
            : List<dynamic>.from(dataResult!.map((x) => x)),
        "error_data": errorData == null
            ? []
            : List<dynamic>.from(errorData!.map((x) => x)),
        "error": error,
      };
}

class Data {
  final int? userid;
  final String? userCode;
  final String? username;
  final String? email;
  final dynamic sex;
  final String? phone;
  final dynamic street;
  final dynamic city;
  final int? state;
  final int? country;
  final String? dob;
  final String? userType;
  final int? rId;
  final int? emailConfirm;
  final int? phoneConfirm;
  final int? confirmed;
  final String? refId;
  final dynamic lastvisitdate;
  final DateTime? whenjoined;
  final DateTime? whenedited;
  final String? firstname;
  final String? lastname;
  final dynamic secretQuestion1;
  final dynamic secretAnswer1;
  final dynamic secretQuestion2;
  final dynamic secretAnswer2;
  final dynamic deletedMeta;
  final int? hasSetUpTransactionPin;
  final String? fullname;

  Data({
    this.userid,
    this.userCode,
    this.username,
    this.email,
    this.sex,
    this.phone,
    this.street,
    this.city,
    this.state,
    this.country,
    this.dob,
    this.userType,
    this.rId,
    this.emailConfirm,
    this.phoneConfirm,
    this.confirmed,
    this.refId,
    this.lastvisitdate,
    this.whenjoined,
    this.whenedited,
    this.firstname,
    this.lastname,
    this.secretQuestion1,
    this.secretAnswer1,
    this.secretQuestion2,
    this.secretAnswer2,
    this.deletedMeta,
    this.hasSetUpTransactionPin,
    this.fullname,
  });

  Data copyWith({
    int? userid,
    String? userCode,
    String? username,
    String? email,
    dynamic sex,
    String? phone,
    dynamic street,
    dynamic city,
    int? state,
    int? country,
    String? dob,
    String? userType,
    int? rId,
    int? emailConfirm,
    int? phoneConfirm,
    int? confirmed,
    String? refId,
    dynamic lastvisitdate,
    DateTime? whenjoined,
    DateTime? whenedited,
    String? firstname,
    String? lastname,
    dynamic secretQuestion1,
    dynamic secretAnswer1,
    dynamic secretQuestion2,
    dynamic secretAnswer2,
    dynamic deletedMeta,
    int? hasSetUpTransactionPin,
    String? fullname,
  }) =>
      Data(
        userid: userid ?? this.userid,
        userCode: userCode ?? this.userCode,
        username: username ?? this.username,
        email: email ?? this.email,
        sex: sex ?? this.sex,
        phone: phone ?? this.phone,
        street: street ?? this.street,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        dob: dob ?? this.dob,
        userType: userType ?? this.userType,
        rId: rId ?? this.rId,
        emailConfirm: emailConfirm ?? this.emailConfirm,
        phoneConfirm: phoneConfirm ?? this.phoneConfirm,
        confirmed: confirmed ?? this.confirmed,
        refId: refId ?? this.refId,
        lastvisitdate: lastvisitdate ?? this.lastvisitdate,
        whenjoined: whenjoined ?? this.whenjoined,
        whenedited: whenedited ?? this.whenedited,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        secretQuestion1: secretQuestion1 ?? this.secretQuestion1,
        secretAnswer1: secretAnswer1 ?? this.secretAnswer1,
        secretQuestion2: secretQuestion2 ?? this.secretQuestion2,
        secretAnswer2: secretAnswer2 ?? this.secretAnswer2,
        deletedMeta: deletedMeta ?? this.deletedMeta,
        hasSetUpTransactionPin:
            hasSetUpTransactionPin ?? this.hasSetUpTransactionPin,
        fullname: fullname ?? this.fullname,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userid: json["userid"],
        userCode: json["user_code"],
        username: json["username"],
        email: json["email"],
        sex: json["sex"],
        phone: json["phone"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        dob: json["dob"],
        userType: json["user_type"],
        rId: json["r_id"],
        emailConfirm: json["email_confirm"],
        phoneConfirm: json["phone_confirm"],
        confirmed: json["confirmed"],
        refId: json["ref_id"],
        lastvisitdate: json["lastvisitdate"],
        whenjoined: json["whenjoined"] == null
            ? null
            : DateTime.parse(json["whenjoined"]),
        whenedited: json["whenedited"] == null
            ? null
            : DateTime.parse(json["whenedited"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        secretQuestion1: json["secret_question1"],
        secretAnswer1: json["secret_answer1"],
        secretQuestion2: json["secret_question2"],
        secretAnswer2: json["secret_answer2"],
        deletedMeta: json["deleted_meta"],
        hasSetUpTransactionPin: json["has_set_up_transaction_pin"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "user_code": userCode,
        "username": username,
        "email": email,
        "sex": sex,
        "phone": phone,
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "dob": dob,
        "user_type": userType,
        "r_id": rId,
        "email_confirm": emailConfirm,
        "phone_confirm": phoneConfirm,
        "confirmed": confirmed,
        "ref_id": refId,
        "lastvisitdate": lastvisitdate,
        "whenjoined": whenjoined?.toIso8601String(),
        "whenedited": whenedited?.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "secret_question1": secretQuestion1,
        "secret_answer1": secretAnswer1,
        "secret_question2": secretQuestion2,
        "secret_answer2": secretAnswer2,
        "deleted_meta": deletedMeta,
        "has_set_up_transaction_pin": hasSetUpTransactionPin,
        "fullname": fullname,
      };
}
