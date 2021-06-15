import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/views/new_post_view.dart';
import 'package:flutter_mobx_template/repository/i_post_repository.dart';
import 'package:flutter_mobx_template/ui/functions/show_adaptive_dialog.dart';
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
  bool _isSaving = false;
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @observable
  TextEditingController textController = TextEditingController(text: '');

  @computed
  bool get isSaving => _isSaving;

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
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return NewPostPage(postViewModel: postViewModel);
      },
      backgroundColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
    );
  }

  @action
  String? validateTextPost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please insert a message to your new post';
    }
    return null;
  }

  @action
  Future<void> addNewPost(BuildContext context) async {
    try {
      _isSaving = true;
      if (formKey.currentState!.validate()) {
        await _repository.add(
          text: textController.text,
          creationDate: DateTime.now().toString(),
        );
        textController.clear(); // empty TextEditingController
        await loadPosts();
        Navigator.of(context).pop(); // close BottomSheet
      }
    } catch (e) {
      await showAdaptiveDialog(
        context: context,
        title: 'Error',
        content: e.toString(),
      );
    } finally {
      _isSaving = false;
    }
  }
}
