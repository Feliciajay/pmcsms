import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/repository/create_group_repository.dart';

class CreateGroupNotifier
    extends AutoDisposeNotifier<BaseState<CreateGroupResponse>> {
  CreateGroupNotifier();

  late CreateGroupRepository _createGroupRepository;

  @override
  BaseState<CreateGroupResponse> build() {
    _createGroupRepository = ref.read(createGroupRepositoryProvider);

    return BaseState<CreateGroupResponse>.initial();
  }

  Future<void> createGroup({
    required CreateGroupRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _createGroupRepository.createGroup(data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.success, data: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final createGroupNotifier = NotifierProvider.autoDispose<CreateGroupNotifier,
    BaseState<CreateGroupResponse>>(
  CreateGroupNotifier.new,
);
