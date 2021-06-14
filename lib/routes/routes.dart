import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/routes/route_names.dart';
import 'package:flutter_mobx_template/views/post_view.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteNames.posts: (BuildContext context) => const PostView(),
};
