// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'version_helper.dart';

class NewVersionModal extends StatelessWidget {
  const NewVersionModal._(this.newVersionAvailableText, this.applyText);

  static bool _opened = false;

  static Future open(
    BuildContext context, {
    String newVersionAvailableText = 'NEW VERSION AVAILABLE',
    String applyText = 'Apply',
  }) async {
    if (_opened) return;

    _opened = true;

    try {
      await showDialog(
        context: context,
        builder: (context) =>
            NewVersionModal._(newVersionAvailableText, applyText),
      );
    } finally {
      _opened = false;
    }
  }

  final String newVersionAvailableText;
  final String applyText;

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Container(
          height: 100,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                newVersionAvailableText ?? 'NEW VERSION AVAILABLE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text(applyText ?? 'Apply'),
                  onPressed: () => VersionHelper.refresh(),
                ),
              ),
            ],
          ),
        ),
      );
}
