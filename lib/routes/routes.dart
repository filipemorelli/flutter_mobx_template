import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/modules/posts/view_model/post_view_model.dart';
import 'package:flutter_mobx_template/modules/posts/views/post_view.dart';
import 'package:flutter_mobx_template/repository/implementation/post_repository.dart';
import 'package:flutter_mobx_template/routes/route_names.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteNames.posts: (BuildContext context) => PostView(
        postViewModel: PostViewModel(
          Provider.of<PostRepository>(context, listen: false),
        ),
      ),
};
