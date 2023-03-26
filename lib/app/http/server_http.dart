import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mueynail/app/models/enums/platform.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/app/models/shop/event_model.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';
import 'package:mueynail/app/models/user/user_token_model.dart';
import 'package:path_provider/path_provider.dart';

class ServerHttp {
  static final ServerHttp _singleton = ServerHttp._internal();

  factory ServerHttp() {
    return _singleton;
  }

  late CacheOptions _dioCacheOptions;
  late Dio _commonHttp;
  late Dio _shopHttp;

  ServerHttp._internal() {
    _initHttpDio();
  }

  _initHttpDio() async {
    // await _initDioCacheOptions();

    _commonHttp = Dio(BaseOptions(baseUrl: '${dotenv.env['API_HOST']!}/api'));
    _shopHttp = Dio(
      BaseOptions(baseUrl: '${dotenv.env['API_HOST']!}/api/shop/${dotenv.env['SHOP_ID']!}'),
    );
  }

  Future<void> _initDioCacheOptions() async {
    var directory = await getTemporaryDirectory();

    _dioCacheOptions = CacheOptions(
      store: HiveCacheStore(directory.path),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(minutes: 5),
    );
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

  Future<List<ShopModel>> fetchShopList() async {
    final response = await _commonHttp.get('/tower/v1/shop');
    final List<dynamic> json = response.data['data'];

    List<ShopModel> result = json.map((item) => ShopModel.fromJson(item)).toList();

    return result;
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
