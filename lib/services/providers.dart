import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/flavors.dart';
import 'package:flutter_mobx_template/repository/implementation/post_repository.dart';
import 'package:flutter_mobx_template/services/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = <Provider<dynamic>>[
  Provider<Dio>(
    lazy: false,
    create: (BuildContext ctx) => Api(F.env.baseUrl).init(),
  ),
  Provider<PostRepository>(
    create: (BuildContext ctx) => PostRepository(ctx.read<Dio>()),
  ),
];
