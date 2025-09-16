class GetBalanceResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  GetBalanceResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  GetBalanceResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      GetBalanceResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory GetBalanceResponse.fromJson(Map<String, dynamic> json) =>
      GetBalanceResponse(
        serverMessage: json["server_message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        dataResult: json["data_result"] == null
            ? []
            : List<dynamic>.from(json["data_result"]!.map((x) => x)),
        errorData: json["error_data"] == null
            ? []
            : List<dynamic>.from(json["error_data"]!.map((x) => x)),
        textStatus: json["text_status"],
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
        "text_status": textStatus,
        "error": error,
      };
}

class Data {
  final List<Balance>? balance;
  final List<Account>? accounts;

  Data({
    this.balance,
    this.accounts,
  });

  Data copyWith({
    List<Balance>? balance,
    List<Account>? accounts,
  }) =>
      Data(
        balance: balance ?? this.balance,
        accounts: accounts ?? this.accounts,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json["balance"] == null
            ? []
            : List<Balance>.from(
                json["balance"]!.map((x) => Balance.fromJson(x))),
        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"]!.map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance == null
            ? []
            : List<dynamic>.from(balance!.map((x) => x.toJson())),
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
      };
}

class Account {
  final String? bankName;
  final String? accountNumber;
  final String? customerName;
  final String? paymentGateway;

  Account({
    this.bankName,
    this.accountNumber,
    this.customerName,
    this.paymentGateway,
  });

  Account copyWith({
    String? bankName,
    String? accountNumber,
    String? customerName,
    String? paymentGateway,
  }) =>
      Account(
        bankName: bankName ?? this.bankName,
        accountNumber: accountNumber ?? this.accountNumber,
        customerName: customerName ?? this.customerName,
        paymentGateway: paymentGateway ?? this.paymentGateway,
      );

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        bankName: json["bank_name"],
        accountNumber: json["account_number"],
        customerName: json["customer_name"],
        paymentGateway: json["payment_gateway"],
      );

  Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "account_number": accountNumber,
        "customer_name": customerName,
        "payment_gateway": paymentGateway,
      };
}

class Balance {
  final String? name;
  final String? value;
  final String? creditType;
  final String? currency;

  Balance({
    this.name,
    this.value,
    this.creditType,
    this.currency,
  });

  Balance copyWith({
    String? name,
    String? value,
    String? creditType,
    String? currency,
  }) =>
      Balance(
        name: name ?? this.name,
        value: value ?? this.value,
        creditType: creditType ?? this.creditType,
        currency: currency ?? this.currency,
      );

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        name: json["name"],
        value: json["value"],
        creditType: json["credit_type"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "credit_type": creditType,
        "currency": currency,
      };
}
