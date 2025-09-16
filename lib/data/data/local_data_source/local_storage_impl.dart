import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';

class SecureStorage {
  SecureStorage._();

  // Singleton instance
  static final SecureStorage _instance = SecureStorage._();

  // Factory constructor to return the same instance every time
  factory SecureStorage() => _instance;

  final _storage = const FlutterSecureStorage(

      // iOptions: IOSOptions.defaultOptions,
      // aOptions: AndroidOptions.defaultOptions,
      );

  Future<void> saveUserEmail(String userEmail) async {
    await _storage.write(key: 'user_email', value: userEmail);
  }

  Future<String?> getUserEmail() async {
    String? value = await _storage.read(key: 'user_email');
    return value;
  }

  Future<void> saveUserForgotPasswordCode(String userEmail) async {
    await _storage.write(key: 'code', value: userEmail);
  }

  Future<String?> getUserForgotPasswordCode() async {
    String? value = await _storage.read(key: 'code');
    return value;
  }

  Future<void> saveUserFirstName(String userEmail) async {
    await _storage.write(key: 'firstName', value: userEmail);
  }

  Future<String?> getUserFirstName() async {
    String? value = await _storage.read(key: 'firstName');
    return value;
  }

  Future<void> saveUserFullName(String userEmail) async {
    await _storage.write(key: 'full_name', value: userEmail);
  }

  Future<String?> getUserFullName() async {
    String? value = await _storage.read(key: 'full_name');
    return value;
  }

  Future<void> saveUserPassword(String userPassword) async {
    await _storage.write(key: 'user_password', value: userPassword);
  }

  Future<String?> getUserPassword() async {
    String? value = await _storage.read(key: 'user_password');
    return value;
  }

  Future<void> saveUserApiKey(String token) async {
    await _storage.write(key: 'api_key', value: token);
  }

  Future<String?> getUserApiKey() async {
    String? value = await _storage.read(key: 'api_key');
    return value;
  }

  Future<void> saveLoginResponse(LoginResponse loginResponse) async {
    try {
      String jsonString = jsonEncode(loginResponse.toJson());
      await _storage.write(key: 'login_response', value: jsonString);
    } catch (e) {
      debugPrint('Error saving login response: $e');
    }
  }

  Future<LoginResponse?> getLoginResponse() async {
    try {
      String? jsonString = await _storage.read(key: 'login_response');
      if (jsonString != null) {
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return LoginResponse.fromJson(jsonMap);
      }
    } catch (e) {
      debugPrint('Error retrieving login response: $e');
    }
    return null;
  }

  Future<void> saveUserAccessToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  Future<String?> getUserAccessToken() async {
    String? value = await _storage.read(key: 'access_token');
    return value;
  }

  Future<void> saveUserRefreshToken(String token) async {
    await _storage.write(key: 'refresh_token', value: token);
  }

  Future<String?> getUserRefreshToken() async {
    String? value = await _storage.read(key: 'refresh_token');
    return value;
  }

  Future<void> saveUserAccountNumber(String token) async {
    await _storage.write(key: 'account_number', value: token);
  }

  Future<String?> getUserAccountNumber() async {
    String? value = await _storage.read(key: 'account_number');
    return value;
  }

  Future<void> saveUserToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getUserToken() async {
    String? value = await _storage.read(key: 'token');
    return value;
  }

  Future<void> saveUserFirebaseToken(String token) async {
    await _storage.write(key: 'firebase_token', value: token);
  }

  Future<String?> getUserFirebaseToken() async {
    String? value = await _storage.read(key: 'firebase_token');
    return value;
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'user_account_name');
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

  Future<void> saveResetPasswordToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getResetPasswordToken() async {
    String? value = await _storage.read(key: 'token');
    return value;
  }

  Future<void> saveUserId(int id) async {
    await _storage.write(key: 'id', value: id.toString());
  }

  Future<String?> getUserId() async {
    String? value = await _storage.read(key: 'id');
    return value;
  }

  Future<void> saveUserPin(String userPin) async {
    await _storage.write(key: 'user_pin', value: userPin);
  }

  Future<String?> getUserPin() async {
    String? value = await _storage.read(key: 'user_pin');
    return value;
  }

  Future<void> saveUserAccountName(String userEmail) async {
    await _storage.write(key: 'user_account_name', value: userEmail);
  }

  Future<String?> getUserAccountName() async {
    String? value = await _storage.read(key: 'user_account_name');
    return value;
  }

  Future<void> saveReferralLink(String userEmail) async {
    await _storage.write(key: 'referral_link', value: userEmail);
  }

  Future<String?> getReferralLink() async {
    String? value = await _storage.read(key: 'referral_link');
    return value;
  }

  Future<void> deleteTransactionDataList() async {
    await _storage.delete(key: 'transaction_data_list');
  }

  Future<void> clearApiKey() async {
    await _storage.delete(key: 'api_key');
    await _storage.delete(key: 'isLoggedIn');
    await _storage.delete(key: 'wallet_response');
    await _storage.delete(key: 'user_biometric_option');
    //await _storage.delete(key: 'user_transact_pin');
  }

  // Future<void> saveUserDetails(
  //     AccountOwnerProfileData accountOwnerProfileData) async {
  //   String jsonString = jsonEncode(accountOwnerProfileData.toJson());
  //   await _storage.write(key: 'user_details', value: jsonString);
  // }

  // Future<AccountOwnerProfileData?> getUserDetails() async {
  //   String? jsonString = await _storage.read(key: 'user_details');
  //   if (jsonString != null) {
  //     Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  //     return AccountOwnerProfileData.fromJson(jsonMap);
  //   }
  //   return null;
  // }

  Future<void> logout({
    bool partialLogout = false,
  }) async {
    if (partialLogout) {
      await clearToken();
      return;
    }
    //  await _localStorage.clear();
    // await saveCurrentState(CurrentState.onboarded);
  }
}

final localStorageProvider = Provider<SecureStorage>(
  (ref) => SecureStorage(),
);
