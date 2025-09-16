import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/add_to_phone_book_response.dart';

class AddToPhonebookNotifierState {
  AddToPhonebookNotifierState({
    required this.loadState,
    required this.addToPhoneBookResponse,
  });
  factory AddToPhonebookNotifierState.initial() {
    return AddToPhonebookNotifierState(
      loadState: LoadState.idle,
      addToPhoneBookResponse: null,
    );
  }

  final LoadState loadState;
  final AddToPhoneBookResponse? addToPhoneBookResponse;
  AddToPhonebookNotifierState copyWith({
    LoadState? loadState,
    AddToPhoneBookResponse? addToPhoneBookResponse,
  }) {
    return AddToPhonebookNotifierState(
      loadState: loadState ?? this.loadState,
      addToPhoneBookResponse:
          addToPhoneBookResponse ?? this.addToPhoneBookResponse,
    );
  }
}
