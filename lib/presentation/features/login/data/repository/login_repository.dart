import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_request.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';

class LoginRepository {
  LoginRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _restClient.login(loginRequest);
      return BaseResponse<LoginResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepository(
    ref.read(restClientProvider),
  ),
);
