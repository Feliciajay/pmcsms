import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/add_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/repository/add_draft_repository.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/notifier/add_draft_state.dart';

class AddDraftsNotifier extends AutoDisposeNotifier<AddDraftsNotifierState> {
  AddDraftsNotifier();

  late AddDraftsRepository _addDraftsRepository;

  @override
  AddDraftsNotifierState build() {
    _addDraftsRepository = ref.read(addDraftsRepositoryProvider);

    return AddDraftsNotifierState.initial();
  }

  Future<void> addDrafts({
    required AddDraftsRequests data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(addDraftsState: LoadState.loading);

    try {
      final value =
          await _addDraftsRepository.addDrafts(addDraftsRequest: data);
      //debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          addDraftsState: LoadState.idle, addDraftsResponse: value.data);

      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(addDraftsState: LoadState.idle);
    }
  }
}

final addDraftsNotifier =
    NotifierProvider.autoDispose<AddDraftsNotifier, AddDraftsNotifierState>(
  AddDraftsNotifier.new,
);
