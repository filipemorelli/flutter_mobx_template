import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshListAdaptive extends StatelessWidget {
  const RefreshListAdaptive({
    Key? key,
    required this.onRefresh,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  Widget _buildIOSList() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAndroidList() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Platform.isIOS ? _buildIOSList() : _buildAndroidList();
    } catch (e) {
      return _buildAndroidList();
    }
  }
}
