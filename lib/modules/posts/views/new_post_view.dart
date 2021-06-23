import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';

import 'package:flutter_mobx_template/modules/posts/widgets/header_input_text.dart';
import 'package:flutter_mobx_template/modules/posts/widgets/input_text.dart';
import 'package:flutter_mobx_template/ui/widgets/buttons/button_with_icon_full_size.dart';
import 'package:flutter_mobx_template/ui/widgets/center_loading.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({
    Key? key,
    required this.newPostViewModel,
  }) : super(key: key);

  final NewPostViewModel newPostViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: newPostViewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderInputText(text: 'New Post'),
              InputText(
                textEditingController: newPostViewModel.textController,
                validator: newPostViewModel.validateTextPost,
              ),
              Observer(
                builder: (_) {
                  return newPostViewModel.isSaving
                      ? const CenterLoading()
                      : ButtonWithIconFullSize(
                          onPressed: () => newPostViewModel.addNewPost(context),
                          text: 'save',
                          icon: const Icon(Icons.add),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
