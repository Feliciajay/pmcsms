import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_request.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_response.dart';

class SignUpRepository {
  SignUpRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<SignUpResponse>> signUp(
      SignUpRequest signUpRequest) async {
    try {
      final response = await _restClient.signUp(signUpRequest);
      return BaseResponse<SignUpResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final signUpRepositoryProvider = Provider<SignUpRepository>(
  (ref) => SignUpRepository(
    ref.read(restClientProvider),
  ),
);
