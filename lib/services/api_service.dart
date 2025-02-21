
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/models/comment.dart';
import 'package:riverpod_example/shared/client_provider.dart';

part 'api_service.g.dart';


class ApiService{
  final Dio dio;
  ApiService(this.dio);

  Future<List<Comment>> getData () async{
    try{

      final response = await dio.get('https://dummyjson.com/comments');
      return (response.data['comments'] as List).map((m) => Comment.fromJson(m)).toList();

    } on DioException catch(err){
      throw 'some error $err';

    }
  }
}

@riverpod
ApiService apiService(Ref ref) {
  return ApiService(ref.watch(clientProvider));
}
