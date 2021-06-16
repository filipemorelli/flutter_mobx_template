import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/repository/i_post_repository.dart';
import 'package:flutter_mobx_template/ui/functions/show_adaptive_dialog.dart';
import 'package:mobx/mobx.dart';

part 'new_post_view_model.g.dart';

class NewPostViewModel = NewPostViewModelBase with _$NewPostViewModel;

abstract class NewPostViewModelBase with Store {
  NewPostViewModelBase(this._repository);

  final IPostRepository _repository;

  @observable
  bool _isSaving = false;
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @observable
  TextEditingController textController = TextEditingController(text: '');

  @computed
  bool get isSaving => _isSaving;

  @action
  String? validateTextPost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please insert a message to your new post';
    }
    return null;
  }

  @action
  Future<Post> addNewPost(BuildContext context) async {
    try {
      _isSaving = true;
      if (!formKey.currentState!.validate()) {
        throw const FormatException('The Form is invalid');
      }
      final Post post = await _repository.add(
        text: textController.text,
        creationDate: DateTime.now().toString(),
      );
      textController.clear(); // empty TextEditingController
      Navigator.of(context).pop(post); // close BottomSheet
      _isSaving = false;
      return post;
    } on FormatException catch (e, stackTrace) {
      _isSaving = false;
      showAdaptiveDialog(
        context: context,
        title: 'Error',
        content: e.message,
      );
      return Future<Post>.error(e, stackTrace);
    } catch (e, stackTrace) {
      _isSaving = false;
      await showAdaptiveDialog(
        context: context,
        title: 'Error',
        content: e.toString(),
      );
      return Future<Post>.error(e, stackTrace);
    }
  }
}
