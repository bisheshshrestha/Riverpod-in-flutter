import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/models/comment.dart';
import 'package:riverpod_example/services/api_service.dart';

part 'gen_provider.g.dart';

@riverpod
Future<List<Comment>> getComments (Ref ref) async {
  return ref.read(apiServiceProvider).getData();
}
