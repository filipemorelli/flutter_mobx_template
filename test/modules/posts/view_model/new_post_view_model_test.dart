import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';
import 'package:flutter_mobx_template/modules/posts/views/new_post_view.dart';
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
    testWidgets('should return success new add new post',
        (WidgetTester tester) async {
      const int id = 1;
      final String text = Faker().randomGenerator.string(20, min: 10);
      final String creationDate = Faker().date.dateTime().toString();
      when(_repository.add(
        text: anyNamed('text'),
        creationDate: anyNamed('creationDate'),
      )).thenAnswer(
          (_) async => Post(id: id, text: text, creationDate: creationDate));

      // Get one valid context
      await tester.pumpWidget(MaterialApp(
          home: Material(
              child: NewPostPage(newPostViewModel: _newPostViewModel))));
      final BuildContext context = tester.element(find.byType(NewPostPage));

      _newPostViewModel.textController.text = text;
      final Post post = await _newPostViewModel.addNewPost(context);
      expect(post.id, id);
      expect(post.text, text);
      expect(post.creationDate, creationDate);
    });

    testWidgets('should return exception when the form is invalid',
        (WidgetTester tester) async {
      const int id = 1;
      final String text = Faker().randomGenerator.string(20, min: 10);
      final String creationDate = Faker().date.dateTime().toString();
      when(_repository.add(
        text: anyNamed('text'),
        creationDate: anyNamed('creationDate'),
      )).thenAnswer(
          (_) async => Post(id: id, text: text, creationDate: creationDate));

      // Get one valid context
      await tester.pumpWidget(MaterialApp(
          home: Material(
              child: NewPostPage(newPostViewModel: _newPostViewModel))));
      final BuildContext context = tester.element(find.byType(NewPostPage));
      try {
        await _newPostViewModel.addNewPost(context);
        fail('Failed test');
      } catch (e) {
        expect(e, isInstanceOf<FormatException>());
        expect(e, isA<FormatException>());
      }
    });
  });
}
