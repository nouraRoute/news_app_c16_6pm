import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c16_6pm/common/network/network_contes.dart';

@module
abstract class DioInjectable {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: NetworkContes.baseUrl));
}
