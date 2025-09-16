class FundAccountOnlineResponse {
  final String? serverMessage;
  final bool? status;
  final Data? data;
  final List<dynamic>? dataResult;
  final List<dynamic>? errorData;
  final String? textStatus;
  final dynamic error;

  FundAccountOnlineResponse({
    this.serverMessage,
    this.status,
    this.data,
    this.dataResult,
    this.errorData,
    this.textStatus,
    this.error,
  });

  FundAccountOnlineResponse copyWith({
    String? serverMessage,
    bool? status,
    Data? data,
    List<dynamic>? dataResult,
    List<dynamic>? errorData,
    String? textStatus,
    dynamic error,
  }) =>
      FundAccountOnlineResponse(
        serverMessage: serverMessage ?? this.serverMessage,
        status: status ?? this.status,
        data: data ?? this.data,
        dataResult: dataResult ?? this.dataResult,
        errorData: errorData ?? this.errorData,
        textStatus: textStatus ?? this.textStatus,
        error: error ?? this.error,
      );

  factory FundAccountOnlineResponse.fromJson(Map<String, dynamic> json) =>
      FundAccountOnlineResponse(
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
  final String? checkoutUrl;
  final String? transactionId;
  final String? notifyUrl;
  final String? successUrl;
  final String? failUrl;
  final int? itemPrice;
  final int? totalCost;
  final String? productType;
  final String? buyerEmail;
  final String? itemDescription;
  final String? transactionMemo;

  Data({
    this.checkoutUrl,
    this.transactionId,
    this.notifyUrl,
    this.successUrl,
    this.failUrl,
    this.itemPrice,
    this.totalCost,
    this.productType,
    this.buyerEmail,
    this.itemDescription,
    this.transactionMemo,
  });

  Data copyWith({
    String? checkoutUrl,
    String? transactionId,
    String? notifyUrl,
    String? successUrl,
    String? failUrl,
    int? itemPrice,
    int? totalCost,
    String? productType,
    String? buyerEmail,
    String? itemDescription,
    String? transactionMemo,
  }) =>
      Data(
        checkoutUrl: checkoutUrl ?? this.checkoutUrl,
        transactionId: transactionId ?? this.transactionId,
        notifyUrl: notifyUrl ?? this.notifyUrl,
        successUrl: successUrl ?? this.successUrl,
        failUrl: failUrl ?? this.failUrl,
        itemPrice: itemPrice ?? this.itemPrice,
        totalCost: totalCost ?? this.totalCost,
        productType: productType ?? this.productType,
        buyerEmail: buyerEmail ?? this.buyerEmail,
        itemDescription: itemDescription ?? this.itemDescription,
        transactionMemo: transactionMemo ?? this.transactionMemo,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        checkoutUrl: json["checkout_url"],
        transactionId: json["transactionId"],
        notifyUrl: json["notify_url"],
        successUrl: json["success_url"],
        failUrl: json["fail_url"],
        itemPrice: json["item_price"],
        totalCost: json["total_cost"],
        productType: json["product_type"],
        buyerEmail: json["buyer_email"],
        itemDescription: json["item_description"],
        transactionMemo: json["transaction_memo"],
      );

  Map<String, dynamic> toJson() => {
        "checkout_url": checkoutUrl,
        "transactionId": transactionId,
        "notify_url": notifyUrl,
        "success_url": successUrl,
        "fail_url": failUrl,
        "item_price": itemPrice,
        "total_cost": totalCost,
        "product_type": productType,
        "buyer_email": buyerEmail,
        "item_description": itemDescription,
        "transaction_memo": transactionMemo,
      };
}
