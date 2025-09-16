import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/exception/logger.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/add_to_phonebook_request.dart';

import 'package:pmcsms/presentation/features/phonebook/data/repository/add_to_phonebook_repository.dart';
import 'package:pmcsms/presentation/features/phonebook/presentation/notifier/add_to_phonebook_state.dart';

class AddToPhoneBookNotifier
    extends AutoDisposeNotifier<AddToPhonebookNotifierState> {
  AddToPhoneBookNotifier();

  late AddToPhonebookRepository _addToPhonebookRepository;

  @override
  AddToPhonebookNotifierState build() {
    _addToPhonebookRepository = ref.read(addToPhoneBookRepositoryProvider);

    return AddToPhonebookNotifierState.initial();
  }

  Future<void> addToPhonebook({
    required AddToPhoneBookRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _addToPhonebookRepository.addToPhonebook(data);
      debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          loadState: LoadState.idle, addToPhoneBookResponse: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final addToPhonebookNotifier = NotifierProvider.autoDispose<
    AddToPhoneBookNotifier, AddToPhonebookNotifierState>(
  AddToPhoneBookNotifier.new,
);
