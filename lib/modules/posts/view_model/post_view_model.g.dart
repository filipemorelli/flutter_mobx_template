// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostViewModel on PostViewModelBase, Store {
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: 'PostViewModelBase.errorMessage'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'PostViewModelBase.hasData'))
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

  final _$getPostsFutureAtom = Atom(name: 'PostViewModelBase.getPostsFuture');

  @override
  ObservableFuture<List<Post>> get getPostsFuture {
    _$getPostsFutureAtom.reportRead();
    return super.getPostsFuture;
  }

  @override
  set getPostsFuture(ObservableFuture<List<Post>> value) {
    _$getPostsFutureAtom.reportWrite(value, super.getPostsFuture, () {
      super.getPostsFuture = value;
    });
  }

  final _$loadPostsAsyncAction = AsyncAction('PostViewModelBase.loadPosts');

  @override
  Future<void> loadPosts() {
    return _$loadPostsAsyncAction.run(() => super.loadPosts());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
getPostsFuture: ${getPostsFuture},
errorMessage: ${errorMessage},
hasData: ${hasData}
    ''';
  }
}
