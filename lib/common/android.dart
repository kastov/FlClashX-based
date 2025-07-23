import 'dart:io';

import 'package:flclashx/plugins/app.dart';
import 'package:flclashx/state.dart';

class Android {
  init() async {
    app?.onExit = () async {
      await globalState.appController.savePreferences();
    };
  }
}

final android = Platform.isAndroid ? Android() : null;
