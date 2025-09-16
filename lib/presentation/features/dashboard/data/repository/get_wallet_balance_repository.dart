import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_request.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_response.dart';

class GetBalanceRepository {
  GetBalanceRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetBalanceResponse>> getWalletBalance({
    required GetBalanceRequest getBalanceRequest,
  }) async {
    try {
      final response = await _restClient.getBalance(getBalanceRequest);
      return BaseResponse(status: response.status!, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getWalletBalanceRepositoryProvider = Provider<GetBalanceRepository>(
  (ref) => GetBalanceRepository(
    ref.read(restClientProvider),
  ),
);
