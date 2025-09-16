import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_state/base_state.dart';
import 'package:pmcsms/core/utils/enums.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_group_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/repository/delete_group_repository.dart';

class DeleteGroupNotifier
    extends AutoDisposeNotifier<BaseState<DeleteGroupResponse>> {
  DeleteGroupNotifier();

  late DeleteGroupRepository _deleteGroupRepository;

  @override
  BaseState<DeleteGroupResponse> build() {
    _deleteGroupRepository = ref.read(deleteGroupRepositoryProvider);

    return BaseState<DeleteGroupResponse>.initial();
  }

  Future<void> deleteGroup({
    required DeleteGroupRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(state: LoadState.loading);

    try {
      final value = await _deleteGroupRepository.deleteGroup(data);

      if (!value.status) throw value.serverMessage.toString();

      state = state.copyWith(state: LoadState.success, data: value.data);
      onSuccess(value.data!.serverMessage!);
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(state: LoadState.idle);
    }
  }
}

final deleteGroupNotifier = NotifierProvider.autoDispose<DeleteGroupNotifier,
    BaseState<DeleteGroupResponse>>(
  DeleteGroupNotifier.new,
);
