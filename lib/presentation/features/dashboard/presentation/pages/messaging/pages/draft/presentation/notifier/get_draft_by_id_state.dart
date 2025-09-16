import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_draft_by_id_response.dart';

class GetDraftByIdNotifierState {
  GetDraftByIdNotifierState({
    required this.getDraftByIdState,
    required this.getDraftByIdResponse,
  });
  factory GetDraftByIdNotifierState.initial() {
    return GetDraftByIdNotifierState(
      getDraftByIdState: LoadState.idle,
      getDraftByIdResponse: null,
    );
  }

  final LoadState getDraftByIdState;
  final GetDraftByIdResponse? getDraftByIdResponse;
  GetDraftByIdNotifierState copyWith({
    LoadState? getDraftByIdState,
    GetDraftByIdResponse? getDraftByIdResponse,
  }) {
    return GetDraftByIdNotifierState(
      getDraftByIdState: getDraftByIdState ?? this.getDraftByIdState,
      getDraftByIdResponse: getDraftByIdResponse ?? this.getDraftByIdResponse,
    );
  }
}
