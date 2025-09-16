
class AddToPhoneBookRequest {
    final String process;
    final String action;
    final String addressBook;
    final String ownerName;

    AddToPhoneBookRequest({
        required this.process,
        required this.action,
        required this.addressBook,
        required this.ownerName,
    });

    AddToPhoneBookRequest copyWith({
        String? process,
        String? action,
        String? addressBook,
        String? ownerName,
    }) => 
        AddToPhoneBookRequest(
            process: process ?? this.process,
            action: action ?? this.action,
            addressBook: addressBook ?? this.addressBook,
            ownerName: ownerName ?? this.ownerName,
        );

    factory AddToPhoneBookRequest.fromJson(Map<String, dynamic> json) => AddToPhoneBookRequest(
        process: json["process"],
        action: json["action"],
        addressBook: json["address_book"],
        ownerName: json["owner_name"],
    );

    Map<String, dynamic> toJson() => {
        "process": process,
        "action": action,
        "address_book": addressBook,
        "owner_name": ownerName,
    };
}
