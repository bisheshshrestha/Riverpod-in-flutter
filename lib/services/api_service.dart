import 'package:dio/dio.dart';
import 'package:riverpod_example/models/category.dart';
import 'package:riverpod_example/models/post.dart';


final dio = Dio();

Future<List<Post>> getPosts () async {

  try{
    final response = await  dio.get('https://jsonplaceholder.typicode.com/posts');

    return (response.data as List).map((post) => Post.fromJson(post) ).toList();
  }on DioException catch(err){
    throw '${err}';
  }

}


Future<List<Category>> getCategories () async {

  try{
    final response = await  dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
    return (response.data['categories'] as List).map((category) => Category.fromJson(category) ).toList();
  }on DioException catch(err){
    throw '${err}';
  }

}