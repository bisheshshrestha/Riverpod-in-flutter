

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/services/api_service.dart';


final postProvider = FutureProvider((ref){
  return getPosts();
});

final categoryProvider = FutureProvider((ref){
  return getCategories();
});