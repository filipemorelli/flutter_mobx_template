import 'package:json_annotation/json_annotation.dart';
part 'env.g.dart';

@JsonSerializable()
class Env {
  Env({
    required this.title,
    required this.baseUrl,
  });
  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);

  String title;
  String baseUrl;

  Map<String, dynamic> toJson() => _$EnvToJson(this);
}
