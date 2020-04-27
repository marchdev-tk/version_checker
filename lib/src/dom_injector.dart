// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dom_injector/dom_injector_stub.dart'
    if (dart.library.io) 'dom_injector/dom_injector_io.dart'
    if (dart.library.html) 'dom_injector/dom_injector_web.dart';

class DOMInjector {
  static void inject() => DOMInjectorImpl.inject();
}
