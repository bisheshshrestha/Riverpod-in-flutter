import 'package:dio/dio.dart';
import 'package:riverpod_example/models/category.dart';
import 'package:riverpod_example/models/meal.dart';
import 'package:riverpod_example/models/meal_item.dart';

final dio = Dio();

Future<List<Category>>  getCategories () async{
  try{

    final response = await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
   return (response.data['categories'] as List).map((category) => Category.fromJson(category)).toList();
  }on DioException catch(err){
    throw '${err.message}';
  }
}


Future<List<MealItem>>  getCategoryItems ({required String query}) async{
  try{

    final response = await dio.get('https://www.themealdb.com/api/json/v1/1/filter.php', queryParameters: {
      'c': query
    });
    return (response.data['meals'] as List).map((meal) => MealItem.fromJson(meal)).toList();
  }on DioException catch(err){
    throw '${err.message}';
  }
}

Future<List<Meal>>  getMealById ({required String id}) async{
  try{

    final response = await dio.get('https://www.themealdb.com/api/json/v1/1/lookup.php', queryParameters: {
      'i': id
    });
    return (response.data['meals'] as List).map((meal) => Meal.fromJson(meal)).toList();
  }on DioException catch(err){
    throw '${err.message}';
  }
}