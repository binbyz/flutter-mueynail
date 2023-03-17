import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mueynail/app/models/shop/art_model.dart';
import 'package:mueynail/app/models/shop/event_model.dart';

final logger = Logger();

final dio = Dio(BaseOptions(
    baseUrl: '${dotenv.env['API_HOST']!}/api/shop/${dotenv.env['SHOP_ID']!}',
));

/// ----------------------------------------------------------------------------
Future<List<dynamic>> _fetchArtMonthPick() async {
  try {
    final response = await dio.get('/v1/art/month-pick');
    final List<dynamic> data = response.data['data'];

    return data;
  } catch (e) {
    logger.d(e);
    return [];
  }
}

Future<List<ArtModel>> fetchArtMonthPick() async {
  final json = await _fetchArtMonthPick();
  return json.map((item) => ArtModel.fromJson(item)).toList();
}

/// ----------------------------------------------------------------------------

Future<List<dynamic>> _fetchArtCollection() async {
  try {
    final response = await dio.get('/v1/art/collection');
    final List<dynamic> data = response.data['data'];

    return data;
  } catch (e) {
    logger.d(e);
    return [];
  }
}

Future<List<ArtModel>> fetchArtCollection() async {
  final json = await _fetchArtCollection();
  return json.map((item) => ArtModel.fromJson(item)).toList();
}

/// ----------------------------------------------------------------------------

Future<List<dynamic>> _fetchArtList() async {
  try {
    final response = await dio.get('/v1/art/collection');
    final List<dynamic> data = response.data['data'];

    return data;
  } catch (e) {
    logger.d(e);
    return [];
  }
}

Future<List<ArtModel>> fetchArtList() async {
  final json = await _fetchArtList();
  return json.map((item) => ArtModel.fromJson(item)).toList();
}

/// ----------------------------------------------------------------------------

Future<List<dynamic>> _fetchEventList() async {
  try {
    final response = await dio.get('/v1/event');
    final List<dynamic> data = response.data['data'];

    return data;
  } catch (e) {
    logger.d(e);
    return [];
  }
}

Future<List<EventModel>> fetchEventList() async {
  final json = await _fetchEventList();
  return json.map((item) => EventModel.fromJson(item)).toList();
}