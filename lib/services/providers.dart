import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_template/flavors.dart';
import 'package:flutter_mobx_template/services/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = <Provider<dynamic>>[
  Provider<Dio>(create: (BuildContext ctx) => Api(F.serverHost).init()),
];
