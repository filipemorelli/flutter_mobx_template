import 'package:faker/faker.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/post_view_model.dart';
import 'package:flutter_mobx_template/repository/implementation/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './post_view_model_test.mocks.dart';

@GenerateMocks(<Type>[PostRepository])
void main() {
  late MockPostRepository repository;
  late PostViewModel postViewModel;

  setUp(() {
    repository = MockPostRepository();
    postViewModel = PostViewModel(repository);
  });

  group('Load posts', () {
    test('should return a list of posts', () async {
      when(repository.getAll()).thenAnswer(
        (_) async => <Post>[
          Post(id: 1, text: 'text', creationDate: ''),
        ],
      );
      await postViewModel.loadPosts();
      expect(postViewModel.posts.isNotEmpty, true);
    });

    test('should return a Exception', () async {
      when(repository.getAll()).thenThrow(Exception('Fake error'));
      await postViewModel.loadPosts();
      expect(postViewModel.posts.isEmpty, true);
    });
  });

  group('Validation Text Post', () {
    test('should return String when post text is invalid', () async {
      const String? text = null;
      final String? result = postViewModel.validateTextPost(text);
      expect(result?.isNotEmpty, true);
    });

    test('should return null when post text is valid', () async {
      final String text = Faker().randomGenerator.string(30, min: 10);
      final String? result = postViewModel.validateTextPost(text);
      expect(result, null);
    });
  });
}
