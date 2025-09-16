import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_all_drafts_response.dart';

class GetAllDraftsNotifierState {
  GetAllDraftsNotifierState({
    required this.getAllDraftsState,
    required this.getAllDraftsResponse,
  });
  factory GetAllDraftsNotifierState.initial() {
    return GetAllDraftsNotifierState(
      getAllDraftsState: LoadState.idle,
      getAllDraftsResponse: null,
    );
  }

  final LoadState getAllDraftsState;
  final GetAllDraftsResponse? getAllDraftsResponse;
  GetAllDraftsNotifierState copyWith({
    LoadState? getAllDraftsState,
    GetAllDraftsResponse? getAllDraftsResponse,
  }) {
    return GetAllDraftsNotifierState(
      getAllDraftsState: getAllDraftsState ?? this.getAllDraftsState,
      getAllDraftsResponse: getAllDraftsResponse ?? this.getAllDraftsResponse,
    );
  }
}
