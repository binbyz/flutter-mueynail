import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/app/models/shop/event_model.dart';
import 'package:mueynail/app/models/shop/shop_model.dart';

final globalDio = Dio(
  BaseOptions(
    baseUrl: '${dotenv.env['API_HOST']!}/api',
  ),
);

final shopDio = Dio(
  BaseOptions(
    baseUrl: '${dotenv.env['API_HOST']!}/api/shop/${dotenv.env['SHOP_ID']!}',
  ),
);

Future<List<ShopModel>> fetchShop() async {
  final response = await globalDio.get('/shop/v1/shop');
  final List<dynamic> json = response.data['data'];

  return json.map((item) => ShopModel.fromJson(item)).toList();
}

Future<List<ArtModel>> fetchArtMonthPick() async {
  final response = await shopDio.get('/v1/art/month-pick');
  final List<dynamic> json = response.data['data'];

  return json.map((item) => ArtModel.fromJson(item)).toList();
}

Future<List<ArtModel>> fetchArtCollection() async {
  final response = await shopDio.get('/v1/art/collection');
  final List<dynamic> json = response.data['data'];

  return json.map((item) => ArtModel.fromJson(item)).toList();
}

Future<List<ArtModel>> fetchArtList() async {
  final response = await shopDio.get('/v1/art/collection');
  final List<dynamic> json = response.data['data'];

  return json.map((item) => ArtModel.fromJson(item)).toList();
}

Future<List<EventModel>> fetchEventList() async {
  final response = await shopDio.get('/v1/event');
  final List<dynamic> json = response.data['data'];

  return json.map((item) => EventModel.fromJson(item)).toList();
}
