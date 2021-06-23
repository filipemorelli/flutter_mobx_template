import 'dart:async';

import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/repository/i_post_repository.dart';
import 'package:mobx/mobx.dart';

part 'new_post_view_model.g.dart';

class NewPostViewModel = NewPostViewModelBase with _$NewPostViewModel;

abstract class NewPostViewModelBase with Store {
  NewPostViewModelBase(this._repository);

  final IPostRepository _repository;

  @observable
  String text = '';

  @action
  String? validateTextPost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please insert a message to your new post';
    }
    return null;
  }

  @observable
  ObservableFuture<Post> savePostFuture = ObservableFuture<Post>.error('');

  @computed
  String get errorMessage => savePostFuture.status == FutureStatus.rejected
      ? savePostFuture.error.toString()
      : '';

  @observable
  bool isSavingPost = false;

  @action
  Future<Post> addNewPost() async {
    try {
      isSavingPost = true;
      savePostFuture = _repository
          .add(text: text, creationDate: DateTime.now().toString())
          .asObservable();
      final Post post = await savePostFuture;
      isSavingPost = false;
      return post;
    } catch (e, stackTrace) {
      isSavingPost = false;
      return Future<Post>.error(e, stackTrace);
    }
  }
}
