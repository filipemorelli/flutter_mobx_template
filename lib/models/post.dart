import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.id,
    required this.text,
    required this.creationDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  int id;
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: '', name: 'creation-date')
  String creationDate;

  Map<String, dynamic> toJson() => _$PostToJson(this);

  DateTime get createdAtDatetime => DateTime.parse(creationDate);
}
