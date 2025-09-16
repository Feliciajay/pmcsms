import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_response.dart';

class CreateGroupRepository {
  CreateGroupRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<CreateGroupResponse>> createGroup(
      CreateGroupRequest request) async {
    try {
      final response = await _restClient.createGroup(request);
      return BaseResponse<CreateGroupResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final createGroupRepositoryProvider = Provider<CreateGroupRepository>(
  (ref) => CreateGroupRepository(
    ref.read(restClientProvider),
  ),
);
