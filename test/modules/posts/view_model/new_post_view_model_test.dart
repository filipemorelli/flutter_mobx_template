import 'package:faker/faker.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';
import 'package:flutter_mobx_template/repository/implementation/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './new_post_view_model_test.mocks.dart';

@GenerateMocks(<Type>[PostRepository])
void main() {
  late NewPostViewModel _newPostViewModel;
  late MockPostRepository _repository;

  setUp(() {
    _repository = MockPostRepository();
    _newPostViewModel = NewPostViewModel(_repository);
  });

  group('Validation Text Post', () {
    test('should return String when post text is invalid', () async {
      const String? text = null;
      final String? result = _newPostViewModel.validateTextPost(text);
      expect(result?.isNotEmpty, true);
    });

    test('should return null when post text is valid', () async {
      final String text = Faker().randomGenerator.string(30, min: 10);
      final String? result = _newPostViewModel.validateTextPost(text);
      expect(result, null);
    });
  });

  group('Save new post', () {
    test('should return success new add new post', () async {
      const int id = 1;
      final String text = Faker().randomGenerator.string(20, min: 10);
      final String creationDate = Faker().date.dateTime().toString();
      when(_repository.add(
        text: anyNamed('text'),
        creationDate: anyNamed('creationDate'),
      )).thenAnswer(
          (_) async => Post(id: id, text: text, creationDate: creationDate));

      _newPostViewModel.text = text;
      final Post post = await _newPostViewModel.addNewPost();
      expect(post.id, id);
      expect(post.text, text);
      expect(post.creationDate, creationDate);
    });

    test('should return exception when the form is invalid', () async {
      const int id = 1;
      final String text = Faker().randomGenerator.string(20, min: 10);
      final String creationDate = Faker().date.dateTime().toString();
      when(_repository.add(
        text: anyNamed('text'),
        creationDate: anyNamed('creationDate'),
      )).thenAnswer(
          (_) async => Post(id: id, text: text, creationDate: creationDate));

      try {
        _newPostViewModel.text = text;
        await _newPostViewModel.addNewPost();
        fail('Failed test');
      } catch (e) {
        expect(e, isInstanceOf<FormatException>());
        expect(e, isA<FormatException>());
      }
    });
  });
}
