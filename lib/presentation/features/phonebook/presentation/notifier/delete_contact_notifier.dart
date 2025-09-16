import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_contact_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_contact_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/repository/delete_contact_repository.dart';

class DeleteContactNotifier
    extends AutoDisposeNotifier<BaseState<DeleteContactResponse>> {
  DeleteContactNotifier();

  late DeleteContactRepository _deleteContactRepository;

  @override
  BaseState<DeleteContactResponse> build() {
    _deleteContactRepository = ref.read(deleteContactRepositoryProvider);

    return BaseState<DeleteContactResponse>.initial();
  }

  Future<void> deleteContact({
    required DeleteContactRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _deleteContactRepository.deleteContact(data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.success, data: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final deleteContactNotifier = NotifierProvider.autoDispose<
    DeleteContactNotifier, BaseState<DeleteContactResponse>>(
  DeleteContactNotifier.new,
);
