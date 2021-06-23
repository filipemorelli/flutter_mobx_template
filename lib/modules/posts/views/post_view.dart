import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/new_post_view_model.dart';
import 'package:flutter_mobx_template/modules/posts/views/new_post_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobx_template/flavors.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/ui/widgets/post_card_item.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/post_view_model.dart';
import 'package:flutter_mobx_template/repository/implementation/post_repository.dart';
import 'package:flutter_mobx_template/ui/refresh_list_adaptive.dart';
import 'package:flutter_mobx_template/ui/widgets/center_loading.dart';

class PostView extends StatelessWidget {
  PostView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  Future<void> openBottomSheetNewPost({
    required BuildContext context,
    required PostRepository repository,
    required Future<void> Function() reloadPosts,
  }) async {
    final Post? result = await showModalBottomSheet<Post>(
      context: context,
      builder: (BuildContext context) {
        return NewPostPage(viewModel: NewPostViewModel(repository));
      },
      backgroundColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
    );
    if (result != null) {
      reloadPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(F.env.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                openBottomSheetNewPost(
                  context: context,
                  reloadPosts: viewModel.loadPosts,
                  repository:
                      Provider.of<PostRepository>(context, listen: false),
                );
              },
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            if (!viewModel.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const CenterLoading(),
                  ),
                  ElevatedButton.icon(
                    onPressed: viewModel.loadPosts,
                    label: const Text('Refresh'),
                    icon: const Icon(Icons.refresh),
                  )
                ],
              );
            }

            if (viewModel.errorMessage.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(viewModel.errorMessage),
                  ElevatedButton.icon(
                    onPressed: viewModel.loadPosts,
                    label: const Text('Refresh'),
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              );
            }

            return RefreshListAdaptive(
              onRefresh: viewModel.loadPosts,
              itemBuilder: (BuildContext context, int i) {
                final Post post = viewModel.posts[i];
                return PostCardItem(
                  key: Key(post.id.toString()),
                  id: post.id.toString(),
                  text: post.text,
                  createdAt:
                      DateFormat.yMd().add_Hms().format(post.createdAtDatetime),
                );
              },
              itemCount: viewModel.posts.length,
            );
          },
        ),
      ),
    );
  }
}
