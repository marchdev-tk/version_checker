// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:pub_semver/pub_semver.dart';

import 'version_helper/version_helper_stub.dart'
    if (dart.library.io) 'version_helper/version_helper_io.dart'
    if (dart.library.html) 'version_helper/version_helper_web.dart';

class VersionHelper {
  static void refresh() => VersionHelperImpl.refresh();

  static Future<Version> getActualVersion() =>
      VersionHelperImpl.getActualVersion();

  static Future<Version> getAppVersion() => VersionHelperImpl.getAppVersion();
}
