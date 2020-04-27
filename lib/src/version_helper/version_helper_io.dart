// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub_semver/pub_semver.dart';
import 'package:package_info/package_info.dart';

class VersionHelperImpl {
  static void refresh() {}

  static Future<Version> getActualVersion() async =>
      Version.parse((await PackageInfo.fromPlatform()).version);

  static Future<Version> getAppVersion() async =>
      Version.parse((await PackageInfo.fromPlatform()).version);
}
