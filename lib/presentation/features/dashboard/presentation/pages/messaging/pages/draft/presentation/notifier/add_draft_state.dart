import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/add_draft_response.dart';

class AddDraftsNotifierState {
  AddDraftsNotifierState({
    required this.addDraftsState,
    required this.addDraftsResponse,
  });
  factory AddDraftsNotifierState.initial() {
    return AddDraftsNotifierState(
      addDraftsState: LoadState.idle,
      addDraftsResponse: null,
    );
  }

  final LoadState addDraftsState;
  final AddDraftsResponse? addDraftsResponse;
  AddDraftsNotifierState copyWith({
    LoadState? addDraftsState,
    AddDraftsResponse? addDraftsResponse,
  }) {
    return AddDraftsNotifierState(
      addDraftsState: addDraftsState ?? this.addDraftsState,
      addDraftsResponse: addDraftsResponse ?? this.addDraftsResponse,
    );
  }
}
