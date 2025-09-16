import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/delete_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/repository/delete_draft_repository.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/notifier/delete_draft_state.dart';

class DeleteDraftNotifier
    extends AutoDisposeNotifier<DeleteDraftNotifierState> {
  DeleteDraftNotifier();

  late DeleteDraftRepository _deleteDraftRepository;

  @override
  DeleteDraftNotifierState build() {
    _deleteDraftRepository = ref.read(deleteDraftRepositoryProvider);

    return DeleteDraftNotifierState.initial();
  }

  Future<void> deleteDraft({
    required DeleteDraftRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(deleteDraftState: LoadState.loading);

    try {
      final value =
          await _deleteDraftRepository.deleteDraft(deleteDraftRequest: data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          deleteDraftState: LoadState.idle, deleteDraftResponse: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(deleteDraftState: LoadState.idle);
    }
  }
}

final deleteDraftNotifier =
    NotifierProvider.autoDispose<DeleteDraftNotifier, DeleteDraftNotifierState>(
  DeleteDraftNotifier.new,
);
