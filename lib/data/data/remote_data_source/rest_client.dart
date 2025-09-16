import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/config/env/base_env.dart';
import 'package:pmcsms/core/config/env/prod_env.dart';
import 'package:pmcsms/core/config/interceptors/header_interceptor.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/model/buy_unit_request.dart';
import 'package:pmcsms/presentation/features/buy_unit/data/model/buy_unit_response.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_request.dart';
import 'package:pmcsms/presentation/features/dashboard/data/model/get_balance_response.dart';

import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/add_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/add_draft_response.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/delete_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/delete_draft_response.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_all_drafts_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_all_drafts_response.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_draft_by_id_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/get_draft_by_id_response.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/update_draft_request.dart';
import 'package:pmcsms/presentation/features/dashboard/presentation/pages/messaging/pages/draft/data/models/update_draft_response.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/forgot_password_request.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/forgot_password_response.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/verify_otp_request.dart';
import 'package:pmcsms/presentation/features/forgot_password/data/model/verify_otp_request_response.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/confirm_payment_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/confirm_payment_response.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/fund_account_online_request.dart';
import 'package:pmcsms/presentation/features/fund_wallet/data/model/fund_account_online_response.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_request.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/add_to_phone_book_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/add_to_phonebook_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/create_group_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_contact_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_contact_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_group_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/delete_group_response.dart';

import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_contacts_response.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_groups_request.dart';
import 'package:pmcsms/presentation/features/phonebook/data/model/get_all_groups_response.dart';
import 'package:pmcsms/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:pmcsms/presentation/features/reset_password/data/model/reset_password_response.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_request.dart';
import 'package:pmcsms/presentation/features/sign_up/data/model/sign_up_response.dart';
import 'package:pmcsms/presentation/features/transaction_pin/data/set_transaction_pin_request.dart';
import 'package:pmcsms/presentation/features/transaction_pin/data/set_transaction_pin_response.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_request.dart';
import 'package:pmcsms/presentation/features/transactions/data/model/wallet_history_response.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/model/transfer_funds_request.dart';
import 'package:pmcsms/presentation/features/transfer_funds/data/model/transfer_funds_response.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/resend_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/resend_otp_response.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/verify_signup_email_otp_request.dart';
import 'package:pmcsms/presentation/features/verify_email/data/model/verify_signup_email_otp_response.dart';

import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/pmcsms.php')
  Future<SignUpResponse> signUp(
    @Body() SignUpRequest signUpRequest,
  );

  @POST('/pmcsms.php')
  Future<VerifySignupEmailOtpReponse> verifySignUpEmailOtp(
    @Body() VerifySignupEmailOtpRequest verifySignUpEmailOtpRequest,
  );
  @POST('/pmcsms.php')
  Future<ResendOtpResponse> resendOtp(
    @Body() ResendOtpRequest resendOtpRequest,
  );

  @POST('/pmcsms.php')
  Future<SetTransactionPinResponse> setTransactionPin(
    @Body() SetTransactionPinRequest request,
  );

  @POST('/pmcsms.php')
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() ForgotPasswordRequest forgotPasswordRequest,
  );

  @POST('/pmcsms.php')
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );

  @POST('/pmcsms.php')
  Future<VerifyOtpResponse> verifyOtp(
    @Body() VerifyOtpRequest verifyOtpRequest,
  );

  @POST('/pmcsms.php')
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  @POST('/pmcsms.php')
  Future<AddDraftsResponse> addDraft(
    @Body() AddDraftsRequests addDraftRequest,
  );

  @POST('/pmcsms.php')
  Future<AddToPhoneBookResponse> addToPhonebook(
    @Body() AddToPhoneBookRequest addToPhoneBookRequest,
  );

  @POST('/pmcsms.php')
  Future<BuyUnitResponse> buyUnit(
    @Body() BuyUnitRequest request,
  );

  @POST('/pmcsms.php')
  Future<CreateGroupResponse> createGroup(
    @Body() CreateGroupRequest request,
  );

  @POST('/pmcsms.php')
  Future<TransferFundsReponse> transferFunds(
    @Body() TransferFundsRequest request,
  );

  @DELETE('/pmcsms.php')
  Future<DeleteGroupResponse> deleteGroup(
    @Body() DeleteGroupRequest request,
  );

  @DELETE('/pmcsms.php')
  Future<DeleteContactResponse> deleteContact(
    @Body() DeleteContactRequest request,
  );

  @GET('/pmcsms.php')
  Future<GetBalanceResponse> getBalance(
    @Body() GetBalanceRequest getBalanceRequest,
  );

  @GET('/pmcsms.php')
  Future<GetAllGroupsResponse> getAllGroups(
    @Body() GetAllGroupsRequest getAllGroupsRequest,
  );

  @GET('/pmcsms.php')
  Future<WalletHistoryResponse> getWalletHistory(
    @Body() WalletHistoryRequest requestequest,
  );

  @GET('/pmcsms.php')
  Future<GetAllContactsResponse> getAllContacts(
    @Queries() Map<String, dynamic> queries,
    // @Body() GetBalanceRequest getBalanceRequest,
  );

  @GET('/pmcsms.php')
  Future<GetDraftByIdResponse> getDraftById(
    // @Queries() Map<String, dynamic> queries,
    @Body() GetDraftByIdRequest getDraftByIdRequest,
  );

  @GET('/pmcsms.php')
  Future<GetAllDraftsResponse> getAllDrafts(
    @Body() GetAllDraftsRequests getAllDraftsRequest,
  );

  @DELETE('/pmcsms.php')
  Future<DeleteDraftResponse> deleteDraft(
    @Body() DeleteDraftRequest deleteDraftRequest,
  );

  @PUT('/pmcsms.php')
  Future<UpdateDraftResponse> updateDraft(
    @Body() UpdateDraftRequest updateDraftRequest,
  );

  @POST('/pmcsms.php')
  Future<FundAccountOnlineResponse> fundAccountOnline(
    @Body() FundAccountOnlineRequest fundAccountOnline,
  );

  @POST('/pmcsms.php')
  Future<ConfirmPaymentResponse> confirmAccountOnline(
    @Body() ConfirmPaymentRequest confirmAccountOnlineRequest,
  );

  // @POST('/api/inventory/create')
  // Future<CreateInventoryResponse> createInventory(
  //   @Body() CreateInventoryRequest createInventoryRequest,
  // );

  // @POST('/api/invoices/create')
  // Future<CreateInvoiceResponse> createInvoice(
  //   @Body() CreateInvoiceRequest createInvoiceRequest,
  // );

  // @POST('/api/sales/create')
  // Future<CreateSalesResponse> createSales(
  //   @Body() CreateSalesRequest createSalesRequest,
  // );

  // @POST('/api/expenses/create')
  // Future<CreateExpenseResponse> createExpenses(
  //   @Body() CreateExpenseRequest createExpensesRequest,
  // );

  // @DELETE('/api/inventory/delete/{inventoryId}')
  // Future<DeleteInventoryResponse> deleteInventory({
  //   @Path() required String inventoryId,
  // });

  // @GET('/api/inventory')
  // Future<GetInventoryResponse> getAllInventory(
  //     // @Queries() Map<String, dynamic> queries,
  //     );

  // @GET('/api/sales')
  // Future<GetAllSalesResponse> getAllSales();

  // @GET('/api/tasks')
  // Future<GetAllTasksResponse> getAllTasks();

  // @GET('/api/transactions')
  // Future<GetAllTransactionsResponse> getAllTransactions();

  // @GET('/api/expenses')
  // Future<GetAllExpensesResponse> getAllExpenses();

  // @GET('/api/invoices')
  // Future<GetAllInvoiceResponse> getAllInvoices();

  //       @GET('/user')
  // Future<GetAllUserDetailsResponse> getTransaction(
  //     // @Queries() Map<String, dynamic> queries,
  //     );
}

ProviderFamily<Dio, BaseEnv> _dio = Provider.family<Dio, BaseEnv>(
  (ref, env) {
    final dio = Dio();
    // dio.options.baseUrl = 'http://10.0.2.2';
    dio.options.baseUrl = 'https://demo.autobiz.app';
    // dio.options.baseUrl = 'https://abakon.onrender.com/api/users';

    dio.options.headers = {
      'Content-Type': 'application/json',

      // 'Authorization': 'Bearer ${ref.read(tokenProvider)}',
      // 'accept': 'application/json',
    };

    dio.interceptors.add(
      HeaderInterCeptor(
        dio: dio,
        secureStorage: ref.read(localStorageProvider),
        onTokenExpired: () async {
          // await ref.read(localStorageProvider).logout(partialLogout: true);
          //  await ref.read(logOutNotifer.notifier).expireLogOut();
          // ref.read(logOutNotifer.notifier).state = ActivityStatus.loggedOut;
        },
      ),
    );
    return dio;
  },
);

final restClientProvider = Provider((_) {
  final env = switch (F.appFlavor) {
    Flavor.prod => ProdEnv(),
    // Flavor.staging => StagingEnv(),
    //Flavor.dev => DevEnv(),
  };
  // ignore: no_wildcard_variable_uses
  return RestClient(_.read(_dio.call(env)));
});
