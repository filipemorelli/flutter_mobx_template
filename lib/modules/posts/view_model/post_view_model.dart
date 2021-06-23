import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';
import 'package:flutter_mobx_template/modules/posts/views/new_post_view.dart';
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

  @action
  Future<void> loadPosts({BuildContext? context}) async {
    try {
      posts = (await _repository.getAll()).asObservable();
    } catch (e, stackTrace) {
      log(e.toString(),
          name: 'PostViewModel.loadPosts', stackTrace: stackTrace);
      if (context != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> openNewPostBottomSheet(
    BuildContext context,
    PostViewModel postViewModel,
  ) async {
    try {
      final Post? post = await showModalBottomSheet<Post>(
        context: context,
        builder: (BuildContext context) {
          return NewPostPage(newPostViewModel: NewPostViewModel(_repository));
        },
        backgroundColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      );
      if (post != null) {
        loadPosts();
      }
    } catch (e, stackTrace) {
      log(e.toString(), name: 'openNewPostBottomSheet', stackTrace: stackTrace);
    }
  }
}
