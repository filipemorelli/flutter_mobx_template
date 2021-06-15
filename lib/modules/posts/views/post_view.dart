import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_template/flavors.dart';
import 'package:flutter_mobx_template/models/post.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/post_view_model.dart';
import 'package:flutter_mobx_template/modules/posts/widgets/post_card_item.dart';
import 'package:flutter_mobx_template/ui/refresh_list_adaptive.dart';
import 'package:intl/intl.dart';

class PostView extends StatelessWidget {
  const PostView({
    Key? key,
    required this.postViewModel,
  }) : super(key: key);

  final PostViewModel postViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                postViewModel.openNewPostBottomSheet(context, postViewModel),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return RefreshListAdaptive(
            onRefresh: () => postViewModel.loadPosts(context: context),
            itemBuilder: (BuildContext context, int i) {
              final Post post = postViewModel.posts[i];
              return PostCardItem(
                key: Key(post.id.toString()),
                id: post.id.toString(),
                text: post.text,
                createdAt:
                    DateFormat.yMd().add_Hms().format(post.createdAtDatetime),
              );
            },
            itemCount: postViewModel.posts.length,
          );
        },
      ),
    );
  }
}
