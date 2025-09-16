import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:pmcsms/presentation/features/reset_password/data/model/reset_password_response.dart';

class ResetPasswordRepository {
  ResetPasswordRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response = await _restClient.resetPassword(resetPasswordRequest);
      return BaseResponse<ResetPasswordResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final resetPasswordRepositoryProvider = Provider<ResetPasswordRepository>(
  (ref) => ResetPasswordRepository(
    ref.read(restClientProvider),
  ),
);
