import 'dart:async';

import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/repository/i_post_repository.dart';
import 'package:mobx/mobx.dart';

part 'post_view_model.g.dart';

class PostViewModel = PostViewModelBase with _$PostViewModel;

abstract class PostViewModelBase with Store {
  PostViewModelBase(this._repository) {
    loadPosts();
  }

  final IPostRepository _repository;

  @observable
  ObservableList<Post> posts = ObservableList<Post>.of(<Post>[]);

  @observable
  ObservableFuture<List<Post>> getPostsFuture =
      ObservableFuture<List<Post>>.value(<Post>[]);

  @computed
  String get errorMessage => getPostsFuture.status == FutureStatus.rejected
      ? getPostsFuture.error.toString()
      : '';

  @computed
  bool get hasData =>
      getPostsFuture.status == FutureStatus.fulfilled && posts.isNotEmpty;

  @action
  Future<void> loadPosts() async {
    try {
      getPostsFuture = _repository.getAll().asObservable();
      posts = (await getPostsFuture).asObservable();
    } catch (e, stackTrace) {
      return Future<void>.error(e, stackTrace);
    }
  }
}
