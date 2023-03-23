import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mueynail/app/models/user/user_token_model.dart';

class Storage {
  static final Storage _instance = Storage._internal();

  static const String tokenKey = '___token___';

  factory Storage() => _instance;

  Storage._internal();

  final _storage = const FlutterSecureStorage();

  Future<void> setToken(UserTokenModel value) async {
    await write(Storage.tokenKey, value.token);
    await write('user.id', value.user.id.toString());
    await write('user.state', value.user.state.toString());
    await write('user.owner_shop_id', value.user.ownerShopId.toString());
    await write('user.name', value.user.name);
    await write('user.email', value.user.email);
  }

  Future<String?> getToken() async {
    return await read(Storage.tokenKey);
  }

  Future<bool> hasValidToken() async {
    final token = await getToken();

    if (token == null) {
      return false;
    }

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