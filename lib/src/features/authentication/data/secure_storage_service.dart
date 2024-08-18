import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  //Persist key value pair
  Future<void> persistKeyValuePair(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  //Check key existence
  Future<bool> hasKey(String key) async {
    try {
      String? value = await _storage.read(key: key);
      return value != null;
    } catch (e) {
      rethrow;
    }
  }

  //get key
  Future<String?> getKey(String key) async {
    try {
      return _storage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  //delete key
  Future<void> deleteKey(String key) async {
    try {
      return _storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  static const Duration _delayOn = Duration(seconds: 1);

  //Authentication/User keys:
  static const String _tokenKey = 'TOKEN';
  // static const String _emailKey = 'EMAIL';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';
  static const String _offlineTokenKey = 'OFFLINE_TOKEN';

  Future<void> persistToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> persistRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> persistOfflineToken(String offlineToken) async {
    try {
      await _storage.write(key: _offlineTokenKey, value: offlineToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> hasToken({bool? retryDone = false, String? value}) async {
    try {
      value ??= await _storage.read(key: _tokenKey);

      if (retryDone == false && value == null) {
        return await Future.delayed(
          _delayOn,
          () => hasToken(
            retryDone: true,
            value: value,
          ),
        );
      }
      return value != null;
    } catch (e) {
      if (e.toString().contains('BadPaddingException')) {
        // Clear all data if a BadPaddingException is encountered
        deleteAll();
      }
      rethrow;
    }
  }

  Future<bool?> hasRefreshToken() async {
    try {
      String? value = await _storage.read(key: _refreshTokenKey);
      return value != null;
    } catch (e) {
      if (e.toString().contains('BadPaddingException')) {
        // Clear all data if a BadPaddingException is encountered
        deleteAll();
      }
      rethrow;
    }
  }

  Future<bool?> hasOfflineToken() async {
    try {
      String? value = await _storage.read(key: _offlineTokenKey);
      return value != null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteToken() async {
    try {
      return _storage.delete(key: _tokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteRefreshToken() async {
    try {
      return _storage.delete(key: _refreshTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteOfflineToken() async {
    try {
      return _storage.delete(key: _offlineTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      return _storage.read(key: _tokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return _storage.read(key: _refreshTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getOfflineToken() async {
    try {
      return _storage.read(key: _offlineTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      return _storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  const FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
  );
  return SecureStorageService(storage);
});
