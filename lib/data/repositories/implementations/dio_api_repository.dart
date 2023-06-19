import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_consumo_api_http_dio/data/models/post_model.dart';
import 'package:flutter_consumo_api_http_dio/data/repositories/api_repository.dart';
import 'package:flutter_consumo_api_http_dio/data/repositories/errors/api_exception.dart';

class DioApiRepository implements ApiRepository {
  final Dio _dio;

  DioApiRepository({required Dio dio}) : _dio = dio;

  @override
  Future<PostModel?> getPost(int postId) async {
    try {
      final url = '$API_URL/posts/$postId';

      final response = await _dio.get(url);

      return PostModel.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(message: dioError.message ?? 'Erro so carregar post');
    } catch (error, stacktrace) {
      log('Error ao fazer get do post: ', error: error, stackTrace: stacktrace);
      throw ApiException(message: 'Erro ao carregar post');
    }
  }
}
