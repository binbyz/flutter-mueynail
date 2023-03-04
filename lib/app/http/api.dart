import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mueynail/app/models/shop/art.dart';

final logger = Logger();

final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_HOST']!,
    headers: {
      'x-client-shop-id': 'flutter-${dotenv.env['SHOP_ID']!}',
    }
));

Future<List<dynamic>> _fetchArtMonthPick() async {
  try {
    final response = await dio.get('/api/shop/v1/art/month-pick');
    final List<dynamic> data = response.data['data'];

    return data;
  } catch (e) {
    logger.d(e);
    return [];
  }
}

Future<List<Art>> fetchArtMonthPick() async {
  final json = await _fetchArtMonthPick();
  return json.map((item) => Art.fromJson(item)).toList();
}