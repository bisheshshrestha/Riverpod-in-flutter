import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/services/api_service.dart';

final categoryProvider = FutureProvider((ref) {
  return getCategories();
});

// family provider
final itemListProvider = FutureProvider.family((ref,  String query) {
  return getCategoryItems(query: query);
});


final mealProvider = FutureProvider.family((ref,  String id) {
  return getMealById(id: id); 
});

