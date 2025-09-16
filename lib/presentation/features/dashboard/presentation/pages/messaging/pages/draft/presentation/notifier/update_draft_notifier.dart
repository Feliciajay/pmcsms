import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/update_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/repository/update_draft_repository.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/notifier/update_draft_state.dart';

class UpdateDraftNotifier
    extends AutoDisposeNotifier<UpdateDraftNotifierState> {
  UpdateDraftNotifier();

  late UpdateDraftRepository _updateDraftRepository;

  @override
  UpdateDraftNotifierState build() {
    _updateDraftRepository = ref.read(updateDraftRepositoryProvider);

    return UpdateDraftNotifierState.initial();
  }

  Future<void> updateDrafts({
    required UpdateDraftRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(updateDraftState: LoadState.loading);

    try {
      final value =
          await _updateDraftRepository.updateDraft(updateDraftRequest: data);
      //debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          updateDraftState: LoadState.idle, updateDraftResponse: value.data);

      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(updateDraftState: LoadState.idle);
    }
  }
}

final updateDraftNotifier =
    NotifierProvider.autoDispose<UpdateDraftNotifier, UpdateDraftNotifierState>(
  UpdateDraftNotifier.new,
);
