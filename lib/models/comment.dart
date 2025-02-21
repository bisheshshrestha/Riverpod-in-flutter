
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default(0) int id,
    @Default('') String body,
    @Default(0) int postId,
    @Default(0) int likes,
    @Default(const User()) User user


    
}) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class User with _$User {
const factory User({
  @Default(0) int id,
  @Default('') String username,
  @Default('') String fullName,
}) = _User;

factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
