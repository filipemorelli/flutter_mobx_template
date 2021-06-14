import 'package:dio/dio.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/repository/i_post_repository.dart';

class PostRepository extends IPostRepository {
  PostRepository(this._dio);

  final Dio _dio;

  @override
  Future<Post> add({
    required String text,
    required String creationDate,
  }) async {
    try {
      final Response<Map<String, dynamic>> result = await _dio.post(
        '/posts',
        data: <String, dynamic>{
          'text': text,
          'creation-date': creationDate,
        },
      );
      return Post.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      await _dio.delete<dynamic>('/posts/$id');
      return true;
    } catch (e, stackTrace) {
      return Future<bool>.error(e, stackTrace);
    }
  }

  @override
  Future<Post> edit(Post post) async {
    try {
      final Response<Map<String, dynamic>> result =
          await _dio.put('/posts/${post.id}', data: post.toJson());
      return Post.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }

  @override
  Future<List<Post>> getAll() async {
    try {
      final Response<List<dynamic>> result = await _dio.get('/posts');
      return List<Map<String, dynamic>>.from(result.data ?? <dynamic>[])
          .map((Map<String, dynamic> e) => Post.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      return Future<List<Post>>.error(e, stackTrace);
    }
  }
}
