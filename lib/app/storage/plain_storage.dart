import 'package:mueynail/app/models/shop/shop_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlainStorage {
  static final PlainStorage _singleton = PlainStorage._internal();
  static late SharedPreferences _storage;

  factory PlainStorage() {
    return _singleton;
  }

  PlainStorage._internal();

  Future<void> _initSharedPreferences() async {
    _storage = await SharedPreferences.getInstance();
  }

  Future<int?> getSetShopId() async {
    await _initSharedPreferences();

    return _storage.getInt('shop.id');
  }

  Future<void> setShop(int shopId, String shopName, String shopAddress) async {
    await _initSharedPreferences();

    _storage.setInt('shop.id', shopId);
    _storage.setString('shop.name', shopName);
    _storage.setString('shop.address', shopAddress);
  }

  Future<ShopModel> getShopNameAndAddress() async {
    await _initSharedPreferences();

    final shopId = _storage.getInt('shop.id');
    final shopName = _storage.getString('shop.name');
    final shopAddress = _storage.getString('shop.address');

    return ShopModel(id: shopId!, name: shopName!, address: shopAddress!);
  }
}