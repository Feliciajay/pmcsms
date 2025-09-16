import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_groups_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_groups_response.dart';

import 'package:pmcsms/presentation/features/phonebook/data/repository/get_all_groups_repository.dart';

class GetAllGroupsNotifier
    extends AutoDisposeNotifier<BaseState<GetAllGroupsResponse>> {
  GetAllGroupsNotifier();

  late GetAllGroupsRepository _getAllGroupsRepository;

  @override
  BaseState<GetAllGroupsResponse> build() {
    _getAllGroupsRepository = ref.read(getAllGroupsRepositoryProvider);

    return BaseState<GetAllGroupsResponse>.initial();
  }

  Future<void> getAllGroups() async {
    state = state.copyWith(state: LoadState.loading);
    final data = GetAllGroupsRequest(action: 'my_groups', process: 'pm_groups');

    try {
      final value = await _getAllGroupsRepository.getAllGroups(data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.idle, data: value.data);
      //  onSuccess(value.data!.serverMessage!);
    } catch (e) {
      // onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final getAllGroupsNotifier = NotifierProvider.autoDispose<GetAllGroupsNotifier,
    BaseState<GetAllGroupsResponse>>(
  GetAllGroupsNotifier.new,
);
