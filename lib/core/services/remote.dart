import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/api.constants.dart';

part 'remote.g.dart';

@riverpod
Dio remote(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {'api_key': Api.apiKey},
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        handler.next(error);
      },
    ),
  );

  return dio;
}
