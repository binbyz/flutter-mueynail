import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

final logger = Logger();

final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_HOST']!,
    headers: {
      'x-client-shop-id': 'flutter-${dotenv.env['SHOP_ID']!}',
    }
));

Future<List<dynamic>> fetchArtMonthPick() async {
  try {
    final response = await dio.get('/api/shop/v1/art/month-pick');

    // print(response.data['data']);
    logger.v(response.data['data']);

    return response.data['data'];
  } catch (e) {
    logger.d(e);
    return [];
  }
}