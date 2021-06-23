import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_template/models/post.dart';

import 'package:flutter_mobx_template/modules/posts/ui/widgets/header_input_text.dart';
import 'package:flutter_mobx_template/modules/posts/ui/widgets/input_text.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';
import 'package:flutter_mobx_template/ui/functions/show_adaptive_dialog.dart';
import 'package:flutter_mobx_template/ui/widgets/buttons/button_with_icon_full_size.dart';
import 'package:flutter_mobx_template/ui/widgets/center_loading.dart';

class NewPostPage extends StatelessWidget {
  NewPostPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final NewPostViewModel viewModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> saveNewPost(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final Post post = await viewModel.addNewPost();
        // close BottomSheet and return post to previus page
        Navigator.of(context).pop(post);
      } catch (e) {
        showAdaptiveDialog(
          context: context,
          title: 'Error',
          content: viewModel.errorMessage,
        );
      }
    }
  }

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
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderInputText(text: 'New Post'),
              InputText(
                onChanged: (String value) => viewModel.text = value,
                validator: viewModel.validateTextPost,
              ),
              Observer(
                builder: (_) {
                  if (viewModel.isSavingPost) {
                    return const CenterLoading();
                  }
                  return ButtonWithIconFullSize(
                    onPressed: viewModel.text.isNotEmpty
                        ? () => saveNewPost(context)
                        : null,
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
