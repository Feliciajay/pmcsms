import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/update_draft_response.dart';

class UpdateDraftNotifierState {
  UpdateDraftNotifierState({
    required this.updateDraftState,
    required this.updateDraftResponse,
  });
  factory UpdateDraftNotifierState.initial() {
    return UpdateDraftNotifierState(
      updateDraftState: LoadState.idle,
      updateDraftResponse: null,
    );
  }

  final LoadState updateDraftState;
  final UpdateDraftResponse? updateDraftResponse;
  UpdateDraftNotifierState copyWith({
    LoadState? updateDraftState,
    UpdateDraftResponse? updateDraftResponse,
  }) {
    return UpdateDraftNotifierState(
      updateDraftState: updateDraftState ?? this.updateDraftState,
      updateDraftResponse: updateDraftResponse ?? this.updateDraftResponse,
    );
  }
}
