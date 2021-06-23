// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewPostViewModel on NewPostViewModelBase, Store {
  Computed<bool>? _$isSavingComputed;

  @override
  bool get isSaving =>
      (_$isSavingComputed ??= Computed<bool>(() => super.isSaving,
              name: 'NewPostViewModelBase.isSaving'))
          .value;

  final _$_isSavingAtom = Atom(name: 'NewPostViewModelBase._isSaving');

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

  final _$formKeyAtom = Atom(name: 'NewPostViewModelBase.formKey');

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

  final _$textControllerAtom =
      Atom(name: 'NewPostViewModelBase.textController');

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

  final _$addNewPostAsyncAction =
      AsyncAction('NewPostViewModelBase.addNewPost');

  @override
  Future<Post> addNewPost(BuildContext context) {
    return _$addNewPostAsyncAction.run(() => super.addNewPost(context));
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
formKey: ${formKey},
textController: ${textController},
isSaving: ${isSaving}
    ''';
  }
}
