import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/base_response/base_response.dart';
import 'package:pmcsms/core/config/exception/app_exception.dart';
import 'package:pmcsms/data/data/remote_data_source/rest_client.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_contacts_response.dart';

class GetAllContactsRepository {
  GetAllContactsRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetAllContactsResponse>> getAllContacts() async {
    try {
      final response = await _restClient.getAllContacts({
        'process': 'pm_address_books',
        'action': 'get_user_address_books',
      });
      return BaseResponse<GetAllContactsResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllContactsRepositoryProvider = Provider<GetAllContactsRepository>(
  (ref) => GetAllContactsRepository(
    ref.read(restClientProvider),
  ),
);
