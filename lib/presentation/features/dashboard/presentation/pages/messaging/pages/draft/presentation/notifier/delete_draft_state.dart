import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/delete_draft_response.dart';

class DeleteDraftNotifierState {
  DeleteDraftNotifierState({
    required this.deleteDraftState,
    required this.deleteDraftResponse,
  });
  factory DeleteDraftNotifierState.initial() {
    return DeleteDraftNotifierState(
      deleteDraftState: LoadState.idle,
      deleteDraftResponse: null,
    );
  }

  final LoadState deleteDraftState;
  final DeleteDraftResponse? deleteDraftResponse;
  DeleteDraftNotifierState copyWith({
    LoadState? deleteDraftState,
    DeleteDraftResponse? deleteDraftResponse,
  }) {
    return DeleteDraftNotifierState(
      deleteDraftState: deleteDraftState ?? this.deleteDraftState,
      deleteDraftResponse: deleteDraftResponse ?? this.deleteDraftResponse,
    );
  }
}
