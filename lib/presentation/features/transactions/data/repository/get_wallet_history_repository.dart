import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_request.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_response.dart';

class GetWalletHistoryRepository {
  GetWalletHistoryRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<WalletHistoryResponse>> getWalletHistory(
    WalletHistoryRequest request,
  ) async {
    try {
      final response = await _restClient.getWalletHistory(request);
      return BaseResponse<WalletHistoryResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getWalletHistoryRepositoryProvider = Provider<GetWalletHistoryRepository>(
  (ref) => GetWalletHistoryRepository(
    ref.read(restClientProvider),
  ),
);
