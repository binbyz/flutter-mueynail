import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mueynail/app/models/enums/platform.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/app/models/shop/event_model.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';
import 'package:mueynail/app/models/user/user_token_model.dart';

class ServerHttp {
  static final ServerHttp _instance = ServerHttp._internal();
  static final Dio _commonHttp = Dio(BaseOptions(baseUrl: '${dotenv.env['API_HOST']!}/api'));
  static late final Dio _shopHttp = Dio(BaseOptions(baseUrl: '${dotenv.env['API_HOST']!}/api/shop/${dotenv.env['SHOP_ID']!}'));

  ServerHttp._internal();

  factory ServerHttp() {
    return _instance;
  }

  Future<UserTokenModel> fetchLogin(String email, String password) async {
    final response = await _commonHttp.post(
      '/user/v1/login',
      data: {
        'platform': Platform.app.value,
        'email': email,
        'password': password,
      },
    );

    return UserTokenModel.fromJson(response.data);
  }

  Future<List<ShopModel>> fetchShop() async {
    final response = await _commonHttp.get('/shop/v1/shop');
    final List<dynamic> json = response.data['data'];

    return json.map((item) => ShopModel.fromJson(item)).toList();
  }

  Future<List<ArtModel>> fetchArtMonthPick() async {
    final response = await _shopHttp.get('/v1/art/month-pick');
    final List<dynamic> json = response.data['data'];

    return json.map((item) => ArtModel.fromJson(item)).toList();
  }

  Future<List<ArtModel>> fetchArtCollection() async {
    final response = await _shopHttp.get('/v1/art/collection');
    final List<dynamic> json = response.data['data'];

    return json.map((item) => ArtModel.fromJson(item)).toList();
  }

  Future<List<ArtModel>> fetchArtList() async {
    final response = await _shopHttp.get('/v1/art/collection');
    final List<dynamic> json = response.data['data'];

    return json.map((item) => ArtModel.fromJson(item)).toList();
  }

  Future<List<EventModel>> fetchEventList() async {
    final response = await _shopHttp.get('/v1/event');
    final List<dynamic> json = response.data['data'];

    return json.map((item) => EventModel.fromJson(item)).toList();
  }
}