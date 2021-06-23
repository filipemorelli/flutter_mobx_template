// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewPostViewModel on NewPostViewModelBase, Store {
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: 'NewPostViewModelBase.errorMessage'))
          .value;

  final _$textAtom = Atom(name: 'NewPostViewModelBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$savePostFutureAtom =
      Atom(name: 'NewPostViewModelBase.savePostFuture');

  @override
  ObservableFuture<Post> get savePostFuture {
    _$savePostFutureAtom.reportRead();
    return super.savePostFuture;
  }

  @override
  set savePostFuture(ObservableFuture<Post> value) {
    _$savePostFutureAtom.reportWrite(value, super.savePostFuture, () {
      super.savePostFuture = value;
    });
  }

  final _$isSavingPostAtom = Atom(name: 'NewPostViewModelBase.isSavingPost');

  @override
  bool get isSavingPost {
    _$isSavingPostAtom.reportRead();
    return super.isSavingPost;
  }

  @override
  set isSavingPost(bool value) {
    _$isSavingPostAtom.reportWrite(value, super.isSavingPost, () {
      super.isSavingPost = value;
    });
  }

  final _$addNewPostAsyncAction =
      AsyncAction('NewPostViewModelBase.addNewPost');

  @override
  Future<Post> addNewPost() {
    return _$addNewPostAsyncAction.run(() => super.addNewPost());
  }

  final _$NewPostViewModelBaseActionController =
      ActionController(name: 'NewPostViewModelBase');

  @override
  String? validateTextPost(String? value) {
    final _$actionInfo = _$NewPostViewModelBaseActionController.startAction(
        name: 'NewPostViewModelBase.validateTextPost');
    try {
      return super.validateTextPost(value);
    } finally {
      _$NewPostViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
savePostFuture: ${savePostFuture},
isSavingPost: ${isSavingPost},
errorMessage: ${errorMessage}
    ''';
  }
}
