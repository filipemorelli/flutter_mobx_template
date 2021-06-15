import 'package:flutter/material.dart';

class PostCardItem extends StatelessWidget {
  const PostCardItem({
    Key? key,
    required this.id,
    required this.text,
    required this.createdAt,
  }) : super(key: key);

  final String id;
  final String text;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        key: Key(id),
        title: Text(text),
        subtitle: Text(createdAt),
      ),
    );
  }
}
