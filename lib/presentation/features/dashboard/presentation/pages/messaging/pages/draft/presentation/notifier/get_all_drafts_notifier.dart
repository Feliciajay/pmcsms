import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_all_drafts_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/repository/get_all_drafts_repository.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/presentation/notifier/get_all_drafts_state.dart';

class GetAllDraftsNotifier
    extends AutoDisposeNotifier<GetAllDraftsNotifierState> {
  GetAllDraftsNotifier();

  late GetAllDraftsRepository _getAllDraftsRepository;

  @override
  GetAllDraftsNotifierState build() {
    _getAllDraftsRepository = ref.read(getAllDraftsRepositoryProvider);

    return GetAllDraftsNotifierState.initial();
  }

  Future<void> getAllDrafts() async {
    state = state.copyWith(getAllDraftsState: LoadState.loading);
    final data =
        GetAllDraftsRequests(process: 'pm_drafts', action: 'my_drafts');
    try {
      final value =
          await _getAllDraftsRepository.getAllDrafts(getAllDraftsRequest: data);
      //debugLog(data);
      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(
          getAllDraftsState: LoadState.idle, getAllDraftsResponse: value.data);

      // onSuccess(value.data!.serverMessage!);
    } catch (e) {
      // onError(e.toString());
      state = state.copyWith(getAllDraftsState: LoadState.idle);
    }
  }
}

final getAllDraftsNotifier = NotifierProvider.autoDispose<GetAllDraftsNotifier,
    GetAllDraftsNotifierState>(
  GetAllDraftsNotifier.new,
);
