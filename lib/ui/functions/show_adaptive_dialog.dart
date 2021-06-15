import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<dynamic> showAdaptiveDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  Widget dialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      TextButton(
        child: const Text('ok'),
        onPressed: Navigator.of(context).pop,
      )
    ],
  );
  try {
    if (Platform.isIOS) {
      dialog = CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('ok'),
            onPressed: Navigator.of(context).pop,
          )
        ],
      );
    }
  } on PlatformException catch (e, stackTrace) {
    // isWeb
    log(e.toString(),
        name: 'showAdaptiveDialog.PlatformException', stackTrace: stackTrace);
  } catch (e, stackTrace) {
    log(e.toString(), name: 'showAdaptiveDialog', stackTrace: stackTrace);
  }

  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => dialog,
  );
}
