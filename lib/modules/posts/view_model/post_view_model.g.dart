// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostViewModel on PostViewModelBase, Store {
  Computed<bool>? _$isSavingComputed;

  @override
  bool get isSaving =>
      (_$isSavingComputed ??= Computed<bool>(() => super.isSaving,
              name: 'PostViewModelBase.isSaving'))
          .value;

  final _$postsAtom = Atom(name: 'PostViewModelBase.posts');

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$_isSavingAtom = Atom(name: 'PostViewModelBase._isSaving');

  @override
  bool get _isSaving {
    _$_isSavingAtom.reportRead();
    return super._isSaving;
  }

  @override
  set _isSaving(bool value) {
    _$_isSavingAtom.reportWrite(value, super._isSaving, () {
      super._isSaving = value;
    });
  }

  final _$formKeyAtom = Atom(name: 'PostViewModelBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$textControllerAtom = Atom(name: 'PostViewModelBase.textController');

  @override
  TextEditingController get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  final _$loadPostsAsyncAction = AsyncAction('PostViewModelBase.loadPosts');

  @override
  Future<void> loadPosts({BuildContext? context}) {
    return _$loadPostsAsyncAction.run(() => super.loadPosts(context: context));
  }

  final _$addNewPostAsyncAction = AsyncAction('PostViewModelBase.addNewPost');

  @override
  Future<void> addNewPost(BuildContext context) {
    return _$addNewPostAsyncAction.run(() => super.addNewPost(context));
  }

  final _$PostViewModelBaseActionController =
      ActionController(name: 'PostViewModelBase');

  @override
  String? validateTextPost(String? value) {
    final _$actionInfo = _$PostViewModelBaseActionController.startAction(
        name: 'PostViewModelBase.validateTextPost');
    try {
      return super.validateTextPost(value);
    } finally {
      _$PostViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
formKey: ${formKey},
textController: ${textController},
isSaving: ${isSaving}
    ''';
  }
}
