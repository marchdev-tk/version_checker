// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'version_helper.dart';

class NewVersionModal extends StatelessWidget {
  const NewVersionModal._(
    this.newVersionAvailableText,
    this.applyText,
    this.colorScheme,
  );

  static bool _opened = false;

  static Future open(
    BuildContext context,
    ColorScheme colorScheme, {
    String newVersionAvailableText = 'NEW VERSION AVAILABLE',
    String applyText = 'Apply',
  }) async {
    if (_opened) return;

    _opened = true;

    try {
      await showDialog(
        context: context,
        builder: (context) =>
            NewVersionModal._(newVersionAvailableText, applyText, colorScheme),
      );
    } finally {
      _opened = false;
    }
  }

  final String newVersionAvailableText;
  final String applyText;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: colorScheme.background,
        content: Container(
          height: 100,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                newVersionAvailableText,
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  // color: colorScheme.secondary,
                  // textColor: colorScheme.onSecondary,
                  child: Text(applyText),
                  onPressed: () => VersionHelper.refresh(),
                ),
              ),
            ],
          ),
        ),
      );
}
