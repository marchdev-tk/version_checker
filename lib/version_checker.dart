// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library version_checker;

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';

import 'src/dom_injector.dart';
import 'src/version_helper.dart';
import 'src/new_version_popup.dart';

class VersionChecker {
  static const _defaultNewVersionAvailableText = 'NEW VERSION AVAILABLE';
  static const _defaultApplyText = 'Apply';

  static void initialize({
    @required BuildContext Function() contextBuilder,
    Duration timerDelay = const Duration(minutes: 5),
    Duration instantDelay = const Duration(milliseconds: 300),
    String Function(BuildContext context) newVersionAvailableTextBuilder,
    String Function(BuildContext context) applyTextBuilder,
    bool instantCheck = true,
    bool debugOutput = true,
  }) {
    assert(instantCheck != null);
    assert(debugOutput != null);

    DOMInjector.inject();

    if (instantCheck) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) async {
          await Future.delayed(
              instantDelay ?? const Duration(milliseconds: 300));

          final context = contextBuilder();
          checkVersion(
            context: context,
            newVersionAvailableText: newVersionAvailableTextBuilder != null
                ? newVersionAvailableTextBuilder(context)
                : _defaultNewVersionAvailableText,
            applyText: applyTextBuilder != null
                ? applyTextBuilder(context)
                : _defaultApplyText,
            debugOutput: debugOutput,
          );
        },
      );
    }

    Timer.periodic(
      timerDelay ?? const Duration(minutes: 5),
      (_) => SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          final context = contextBuilder();
          checkVersion(
            context: context,
            newVersionAvailableText: newVersionAvailableTextBuilder != null
                ? newVersionAvailableTextBuilder(context)
                : _defaultNewVersionAvailableText,
            applyText: applyTextBuilder != null
                ? applyTextBuilder(context)
                : _defaultApplyText,
            debugOutput: debugOutput,
          );
        },
      ),
    );
  }

  static void checkVersion({
    @required BuildContext context,
    String newVersionAvailableText = _defaultNewVersionAvailableText,
    String applyText = _defaultApplyText,
    bool debugOutput = true,
  }) async {
    final serverVersion = await VersionHelper.getActualVersion();
    final appVersion = await VersionHelper.getAppVersion();

    if (debugOutput) {
      print('-- check version:\n'
          '   serverVersion: $serverVersion;\n'
          '   appVersion: $appVersion');
    }

    if (serverVersion.toString() == '0.0.0') return;
    if (serverVersion > appVersion) {
      await NewVersionModal.open(
        context,
        newVersionAvailableText: newVersionAvailableText,
        applyText: applyText,
      );
    }
  }
}