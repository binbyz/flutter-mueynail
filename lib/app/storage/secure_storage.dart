import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mueynail/app/models/user/user_token_model.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();

  static const String tokenKey = '___token___';

  factory SecureStorage() => _instance;

  SecureStorage._internal();

  final _storage = const FlutterSecureStorage();

  Future<bool> setToken(UserTokenModel value) async {
    await write(SecureStorage.tokenKey, value.token);
    await write('user.id', value.user.id.toString());
    await write('user.state', value.user.state.toString());
    await write('user.owner_shop_id', value.user.ownerShopId.toString());
    await write('user.name', value.user.name);
    await write('user.email', value.user.email);

    return true;
  }

  Future<String?> getToken() async {
    return await read(SecureStorage.tokenKey);
  }

  Future<bool> hasValidToken() async {
    final token = await getToken();

    if (token == null) {
      return false;
    }

    return true;
  }

  Future<bool> removeToken() async {
    await delete(SecureStorage.tokenKey);

    return true;
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}